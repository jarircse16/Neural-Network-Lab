
#include<graphics.h>
#include<conio.h>
#include<iostream>
#include<bits/stdc++.h>
using namespace std;
int main ( )

{

    int gd=DETECT,gm;

//intigraph(&gd,&gm,"c:/tc/bgi");

    initgraph(&gd, &gm, "C:\\TC\\BGI");


    vector<pair<int,int > >class1,class2;
    int x,y;
    cout<<"Enter element of class1....\n";
    for(int i=0; i<4; i++)
    {

        cin>>x>>y;
        class1.push_back({x,y});
    }


    cout<<"Enter the element of class2....\n";
    for(int i=0; i<4; i++)
    {

        cin>>x>>y;
        class2.push_back({x,y});
    }


    cout<< "Enter new point \n";
    cin>>x>>y;
    int d_class1=0;
    int d_class2=0;
    for(int i=0; i<class1.size(); i++)
    {
        d_class1+=sqrt((x-class1[i].first)*(x-class1[i].first)+(y-class1[i].second)*(y-class1[i].second));
    }
    for(int i=0; i<class2.size(); i++)
    {
        d_class2+=sqrt((x-class2[i].first)*(x-class2[i].first)+(y-class2[i].second)*(y-class2[i].second));
    }
    int Min_a=d_class1/class1.size();
    int Min_b=d_class2/class2.size();
    if(Min_a<Min_b)
        class1.push_back({x,y});
    else
        class2.push_back({x,y});
    line(200,0,200,400);
    line(200,400,900,400);
    for(int i=0; i<class1.size(); i++)
        circle(200+class1[i].first,400-class1[i].second,5);


    for(int i=0; i<class2.size(); i++)
        rectangle(200+class2[i].first, 400-class2[i].second, 205+class2[i].first, 405-class2[i].second);


    getch();

    return 0;

}
