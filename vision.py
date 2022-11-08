
import rospy
import tf
from geometry_msgs.msg import Pose, PoseStamped, Twist, Quaternion
from geographic_msgs.msg import GeoPoint, GeoPointStamped
from mavros_msgs.msg import OverrideRCIn
from sensor_msgs.msg import CompressedImage, Image
from mavros_msgs.msg import RCIn
from mavros_msgs.srv import CommandBool
from mavros_msgs.srv import SetMode
from mavros_msgs.srv import CommandTOL
from cv_bridge import CvBridge
import cv2
import numpy as np

pi_2 = 3.141592654 / 2.0

class MavController:
    """
    A simple object to help interface with mavros
    """
    def __init__(self):

        rospy.init_node("mav_control_node")
        rospy.Subscriber("/mavros/local_position/pose", PoseStamped, self.pose_callback)
        rospy.Subscriber("/mavros/rc/in", RCIn, self.rc_callback)
        rospy.Subscriber("raspicam_node/image/compressed", CompressedImage, self.image_callback)

        self.cmd_pos_pub = rospy.Publisher("/mavros/setpoint_position/local", PoseStamped, queue_size=1)
        # self.cmd_set_global_pos = rospy.Publisher("/mavros/global_position/set_gp_origin", PoseStamped, queue_size=1)
        self.cmd_vel_pub = rospy.Publisher("/mavros/setpoint_velocity/cmd_vel_unstamped", Twist, queue_size=1)
        self.rc_override = rospy.Publisher("/mavros/rc/override", OverrideRCIn, queue_size=1)
        self.output_image_pub = rospy.Publisher("/output_image", Image, queue_size=1)
        self.binary_image_pub = rospy.Publisher("/binary_image", Image, queue_size=1)

        self.bridge = CvBridge()
        # mode 0 = STABILIZE
        # mode 4 = GUIDED
        # mode 9 = LAND
        self.mode_service = rospy.ServiceProxy('/mavros/set_mode', SetMode)
        self.arm_service = rospy.ServiceProxy('/mavros/cmd/arming', CommandBool)
        self.takeoff_service = rospy.ServiceProxy('/mavros/cmd/takeoff', CommandTOL)

        self.rc = RCIn()
        self.pose = Pose()
        self.cv_image = CompressedImage()
        self.timestamp = rospy.Time()

        self.binary_image = None
        self.cv_image_HSV = None
        self.height = 308
        self.width = 410
        self.red_lower_bound = 140
        self.blue_lower_bound = 0
        self.green_lower_bound = 0
        self.red_upper_bound = 255
        self.blue_upper_bound = 50
        self.green_upper_bound = 255

    def rc_callback(self, data):
        """
        Keep track of the current manual RC values
        """
        self.rc = data

    def pose_callback(self, data):
        """
        Handle local position information
        """
        self.timestamp = data.header.stamp
        self.pose = data.pose
    
    def image_callback(self, msg):
        #self.cv_image = self.bridge.imgmsg_to_cv2(msg) #, desired_encoding="bgr8")
        np_image = np.fromstring(msg.data, np.uint8)
        self.cv_image = cv2.imdecode(np_image, cv2.IMREAD_COLOR)

    def goto(self, pose):
        """
        Set the given pose as a the next setpoint by sending
        a SET_POSITION_TARGET_LOCAL_NED message. The copter must
        be in GUIDED mode for this to work.
        """
        pose_stamped = PoseStamped()
        pose_stamped.header.stamp = self.timestamp
        pose_stamped.pose = pose

        self.cmd_pos_pub.publish(pose_stamped)

    def goto_xyz_rpy(self, x, y, z, ro, pi, ya):
        pose = Pose()
        pose.position.x = x
        pose.position.y = y
        pose.position.z = z

        quat = tf.transformations.quaternion_from_euler(ro, pi, ya + pi_2)

        pose.orientation.x = quat[0]
        pose.orientation.y = quat[1]
        pose.orientation.z = quat[2]
        pose.orientation.w = quat[3]
        self.goto(pose)
        #print(quat)

    def set_vel(self, vx, vy, vz, avx=0, avy=0, avz=0):
        """
        Send comand velocities. Must be in GUIDED mode. Assumes angular
        velocities are zero by default.
        """
        cmd_vel = Twist()

        cmd_vel.linear.x = vx
        cmd_vel.linear.y = vy
        cmd_vel.linear.z = vz

        cmd_vel.angular.x = avx
        cmd_vel.angular.y = avy
        cmd_vel.angular.z = avz

        self.cmd_vel_pub.publish(cmd_vel)

    def arm(self):
        """
        Arm the throttle
        """
        return self.arm_service(True)

    def disarm(self):
        """
        Disarm the throttle
        """
        return self.arm_service(False)

    def takeoff(self, height=1.0):
        """
        Arm the throttle, takeoff to a few feet, and set to guided mode
        """
        # Set to stabilize mode for arming
        #mode_resp = self.mode_service(custom_mode="0")
        #mode_resp = self.mode_service(custom_mode="4")
        self.arm()

        # Set to guided mode
        mode_resp = self.mode_service(custom_mode="4")

        # Takeoff
        takeoff_resp = self.takeoff_service(altitude=height)

        return takeoff_resp
        return mode_resp

    def land(self):
        """
        Set in LAND mode, which should cause the UAV to descend directly,
        land, and disarm.
        """
        resp = self.mode_service(custom_mode="9")
        self.disarm()
    
    def centroid(self):
        # self.binary_image = cv2.inRange(self.cv_image, (self.blue_lower_bound,self.green_lower_bound,self.red_lower_bound), (self.blue_upper_bound,self.green_upper_bound,self.red_upper_bound))
        self.cv_image_HSV = cv2.cvtColor(self.cv_image, cv2.COLOR_BGR2HSV)
        # self.binary_image = cv2.inRange(self.cv_image_HSV, (5,100,110), (24,255,230)) # 26,100,76
        self.binary_image = cv2.inRange(self.cv_image_HSV, (20,0,100), (40,255,255)) # 26,100,76

        M = cv2.moments(self.binary_image)
 
        if M["m00"] > 0:
            # calculate x,y coordinate of center
            cX = int(M["m10"] / M["m00"])
            cY = int(M["m01"] / M["m00"])
            
            # put text and highlight the center
            self.cv_image_annotated = self.cv_image.copy()
            cv2.circle(self.cv_image_annotated, (cX, cY), 5, (255, 255, 255), -1)
            cv2.putText(self.cv_image_annotated, "centroid", (cX - 25, cY - 25),cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)
            
            return [cX, cY]
        else:
            print('No Centroid Detected')
            self.height = self.cv_image.shape[0]
            self.width = self.cv_image.shape[1]
            return [self.width/2.0, self.height/2.0]

    def contour_centroid(self):
        self.cv_image_HSV = cv2.cvtColor(self.cv_image, cv2.COLOR_BGR2HSV)
        self.binary_image = cv2.inRange(self.cv_image_HSV, (25,30,50), (45,255,255)) # 26,100,76
        contours, hierarchy = cv2.findContours(self.binary_image, mode=cv2.RETR_LIST, method=cv2.CHAIN_APPROX_SIMPLE)
        # self.blank_image = np.zeros(self.cv_image.shape[0:2], dtype='uint8') # blank black img
        # self.contours_image = cv2.drawContours(self.blank_image.copy(), contours, -1, (0,255,0), 1)
        # self.contours_orig_image = cv2.drawContours(self.cv_image.copy(), contours, -1, (0,255,0), 1)
        # self.masked_image = cv2.bitwise_and(self.cv_image, self.cv_image, mask=self.binary_image)
        
        min_width = 5
        min_height = 5
        max_width = 2000
        max_height = 2000
        min_area = 20
        max_area = max_width * max_height
        min_perimeter = 0
        min_vertices = 1
        max_vertices = max_area
        solidity = [50,100]
        min_ratio = 0.3
        max_ratio = 3.0
        output = []
        for c in contours:
            x,y,w,h = cv2.boundingRect(c)
            if (w < min_width or w > max_width):
                continue
            if (h < min_height or h > max_height):
                continue
            area = cv2.contourArea(c)
            if (area < min_area):
                continue
            if (cv2.arcLength(c, True) < min_perimeter):
                continue
            hull = cv2.convexHull(c)
            solid = 100 * area / cv2.contourArea(hull)
            if (solid < solidity[0] or solid > solidity[1]):
                continue
            if (len(c) < min_vertices or len(c) > max_vertices):
                continue
            ratio = (float)(w)/h
            if (ratio < min_ratio or ratio > max_ratio):
                continue
            output.append(c)

        # self.contours_filter_image = cv2.drawContours(self.blank_image.copy(), output, -1, (0,255,0), 1)
        # self.contours_filter_orig_image = cv2.drawContours(self.cv_image.copy(), output, -1, (0,255,0), 1)
        # self.contours_one_image = self.blank_image
        # self.contours_one_orig_image = self.cv_image
        self.cv_image_annotated = self.cv_image.copy()

        if len(output) == 0:
            print('No Centroid Detected')
            self.height = self.cv_image.shape[0]
            self.width = self.cv_image.shape[1]
            return [self.width/2.0, self.height/2.0]
        else:
            biggest_contour = output[0]
            biggest_area = cv2.contourArea(output[0])
            for c in output:
                area = cv2.contourArea(c)
                if area > biggest_area:
                    biggest_area = area
                    biggest_contour = c
            x,y,w,h = cv2.boundingRect(biggest_contour)
            # self.contours_one_image = cv2.drawContours(self.blank_image.copy(), [biggest_contour], -1, (0,255,0), 1)
            # self.contours_one_orig_image = cv2.drawContours(self.cv_image.copy(), [biggest_contour], -1, (0,255,0), 1)
            cv2.circle(self.cv_image_annotated, (int(x+w/2), int(y+h/2)), 0, (0, 0, 255), 10)
            cv2.rectangle(self.cv_image_annotated, (x,y), (x+w, y+h), (0,255,0), 2)
            return [int(x+w/2), int(y+h/2)]

        
def simple_demo():
    """
    A simple demonstration of using mavros commands to control a UAV.
    """
    c = MavController()
    rospy.sleep(1)
    alt = 0.8

    # CAREFUL! this flies drone
    # print("Takeoff " + str(alt))
    # c.takeoff(alt)
    # rospy.sleep(3)
    # c.goto_xyz_rpy(0,0,alt,0,0,0)
    # rospy.sleep(3)
    # print("Takeoff Complete. Entering Find Mode")

    # ang_pos = 0.0
    
    while True:
        # cv2.namedWindow('video_window')
        # cv2.namedWindow('binary_window')
        # cv2.namedWindow('contours_window')
        # cv2.namedWindow('contours_orig_window')
        # cv2.namedWindow('masked_window')
        # cv2.namedWindow('contours_filter_window')
        # cv2.namedWindow('contours_filter_orig_window')
        # cv2.namedWindow('contours_one_window')
        # cv2.namedWindow('contours_one_orig_window')
        if not c.cv_image is None:
            # [x_pixels, y_pixels] = c.centroid()
            [x_pixels, y_pixels] = c.contour_centroid()
            
            # cv2.imshow('video_window', c.cv_image_annotated)
            # cv2.imshow('binary_window', c.binary_image)
            # cv2.imshow('contours_window', c.contours_image)
            # cv2.imshow('contours_orig_window', c.contours_orig_image)
            # cv2.imshow('masked_window', c.masked_image)
            # cv2.imshow('contours_filter_window', c.contours_filter_image)
            # cv2.imshow('contours_filter_orig_window', c.contours_filter_orig_image)
            # cv2.imshow('contours_one_window', c.contours_one_image)
            # cv2.imshow('contours_one_orig_window', c.contours_one_orig_image)

            output_image = c.bridge.cv2_to_imgmsg(c.cv_image_annotated, "bgr8")
            c.output_image_pub.publish(output_image)

            binary_image = c.bridge.cv2_to_imgmsg(c.binary_image)
            c.binary_image_pub.publish(binary_image)

            x_pixels_fromcenter = (x_pixels - (c.width/2.0))
            if x_pixels_fromcenter == 0:
                ang_vel = 0.0
            else:
                ang_vel = x_pixels_fromcenter / (c.width/2.0)
            print("ang_vel", ang_vel)

            # CAREFUL! this flies drone
            # c.set_vel(vx=0, vy=0, vz=0, avx=0, avy=0, avz=ang_vel)
            # ang_pos += ang_vel
            # print("ang_pos", ang_pos)
            # CAREFUL! this flies drone
            # c.goto_xyz_rpy(0.0,0.0,alt,0,0,ang_pos)
            # rospy.sleep(2)

        key = cv2.waitKey(1)
        if key == ord('q') or key == 27:
            break
        # cv.destroyAllWindows()
        # key = cv2.waitKey(1)

    print("Landing")
    c.land()

if __name__=="__main__":
    simple_demo()
