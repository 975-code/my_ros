#include<ros/ros.h>
#include<learning_topic/Person.h>

void CallbackPerson(const learning_topic::Person::ConstPtr& msg)
{
ROS_INFO("suscribe person info: name:%s,age:%d,sex:%d",msg->name.c_str(), msg->age, msg->sex);
}

int main(int argc, char**argv)
{
    //ROS节点初始化
    ros::init(argc, argv,"learning_topic_sub");

    //创建句柄
    ros::NodeHandle n;
    //注册发布话题
    ros::Subscriber learning_topic_sub = n.subscribe("Person",1,CallbackPerson);

    ros::spin();

    return 0;

}