#include <stdio.h>
#include <conio.h>

    int class_1w[20], class_2w[20];
    int class_1h[20], class_2h[20];
    int c1=0,c2=0;

void classter_f();
void recognition_f();

int main()
{
    printf("\n ----Hello everybody-------\n");
    classter_f();

    while(1)
    {
        recognition_f();
    }

    return 0;
}

void classter_f()
{
    int weight[20],height[20];
    int n,i,c1=0,c2=0;

    printf("\n How many inputs : ");
    scanf("%d",&n);

    for(i=0; i<n; i++)
    {
        printf("\n %d. Enter [ wight, height ] : ",i+1) ;
        scanf("%d %d",&weight[i],&height[i]);

        // checking for validity

        if(weight[i]<10 || weight[i]>40 || height[i]<10 || height[i]>40)
        {
            printf("\n Invalid item!<10-40>,<10-40>");
            i--;
        }

        // computation against discriminant function for cluster

        if(weight[i]<=20)
        {
            class_1w[c1]= weight[i];
            class_1h[c1]= height[i];
            c1++;
        }
        else
        {
            class_2w[c2]= weight[i];
            class_2h[c2]= height[i];
            c2++;
        }
    }

    printf("\n ---- After clustering ----- \n") ;

    printf("\n Cluster 1 is : \n") ;
    for(i=0; i<c1; i++)
    {
        printf("\t%d = [%d ,%d]\n",i+1,class_1w[i],class_1h[i]);
    }

    printf("\n Cluster 2 is : \n") ;
    for(i=0; i<c2; i++)
    {
        printf("\t%d = [%d ,%d]\n",i+1,class_2w[i],class_2h[i]);
    }

}


void recognition_f()
{
    int new_w,new_h;

    printf("\n Enter new item [ weight, height] : ");
    scanf("%d %d",&new_w,&new_h);
    printf("\n new item [%d, %d]",new_w,new_h);
    if(new_w<20)
        printf("\n New item is in cluster 1.\n");
    else
        printf("\n New item is in cluster 2.\n ");
    getch();
}
