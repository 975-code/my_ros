#include<ros/ros.h>
#include<learning_topic/Person.h>

int main(int argc, char**argv)
{
    //ROS节点初始化
    ros::init(argc, argv,"learning_topic");

    //创建句柄
    ros::NodeHandle nh;
    //注册发布话题
    ros::Publisher learning_topic_pub = nh.advertise<learning_topic::Person>("Person",1);

    //设置循环频率
    ros::Rate rate(10);
    while(ros::ok)
    {
        learning_topic::Person person;
        person.name ="SUN";
        person.age = 12;
        person.sex = learning_topic::Person::male;
        learning_topic_pub.publish(person);
        ROS_INFO("publish person info: name:%s,age:%d,sex:%d",person.name.c_str(), person.age, person.sex);
        rate.sleep();
    }
}
