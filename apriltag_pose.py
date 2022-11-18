import rospy
import tf
from geometry_msgs.msg import Pose, PoseStamped, PoseWithCovarianceStamped, Twist, Quaternion
from apriltag_ros.msg import AprilTagDetectionArray
from cv_bridge import CvBridge
import cv2
import numpy as np

class ApriltagPoseController:
    """
    A simple object to help interface with /tag_detections and visualize apriltag poses in rviz
    """
    def __init__(self):

        rospy.init_node("apriltag_pose_control_node")
        rospy.Subscriber("/tag_detections", AprilTagDetectionArray, self.pose_callback)
        self.cmd_pos_pub = rospy.Publisher("/tag_detections_pose", PoseWithCovarianceStamped, queue_size=1)
        self.pose = PoseWithCovarianceStamped()
        self.timestamp = rospy.Time()

    def pose_callback(self, data):
        """
        Handle getting first apriltag pose information
        """
        self.timestamp = data.header.stamp
        if len(data.detections) > 0:
            self.pose = data.detections[0].pose
        else:
            self.pose = PoseWithCovarianceStamped()
            self.pose.header.frame_id = "raspicam"
        print("self.pose", self.pose)

        self.cmd_pos_pub.publish(self.pose)
        
if __name__=="__main__":
    # rospy.init_node("apriltag_pose.py")
    c = ApriltagPoseController()
    rospy.spin()
    # rospy.shutdown()