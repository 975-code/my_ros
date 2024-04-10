# include<ros/ros.h>
# include<std_msgs/String.h>
#include<sstream>
#include"mytopic/topic.h"

int main (int argc, char *argv [] )
{
    //1.ros节点初始化
    ros::init(argc,argv, "pub_topic");
    //2.创建句柄
    ros::NodeHandle nh;
    ROS_INFO("start learning topic!");
    //3.创建话题发布者
    ros::Publisher pub = nh.advertise<mytopic::topic>("topic_pub",10);
    //4.发布内容
    mytopic::topic pub_content;
    pub_content.num = 0;
    //5.发布频率
    ros::Rate r(10);
    int count = 0;
    while(ros::ok)  //节点不死
    {
        count++;
        if(count > 10)
        {
            count = 0;
        }
        pub_content.num  = count;
        ROS_INFO("第%d次发布",pub_content.num );
        pub.publish(pub_content);

        r.sleep();
        ros::spinOnce();
    }

    return 0;

}