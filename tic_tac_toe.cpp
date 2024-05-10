#include <iostream>
using namespace std;
void change(int num,int y[3][3],int tw){
    for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){ 
    if (tw%2!=0){
      if (num==y[i][j]){
          y[i][j]=0;
      }
      cout<<y[i][j]<<" ";
      }
    else{
        if (num==y[i][j]){
          y[i][j]=1;
      }
      cout<<y[i][j]<<" ";
      }
   }
   cout<<endl;
   } 
}




int win(int y[3][3]){
    int v=1;
  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){ 
        if(y[0][j]==0 ){
          if (y[1][j]==0 ){
            if (y[2][j]==0 ){
                v=0;
        }
        }
        }
         if(y[0][j]==1){
          if ( y[1][j]==1){
            if ( y[2][j]==1){
                v=0;
        }
        }
        }
         if( y[i][0]==1){
          if ( y[i][1]==1){
            if ( y[i][2]==1){
                v=0;
        }
        }
        }
         if(y[i][0]==0 ){
          if (y[i][1]==0 ){
            if (y[i][2]==0 ){
                v=0;
        }
        }
        }
        if(y[0][2]==0 ){
          if (y[1][1]==0 ){
            if (y[2][0]==0 ){
                v=0;
        }
        }
        }
        if( y[0][2]==1){
          if ( y[1][1]==1){
            if ( y[2][0]==1){
                v=0;
        }
        }
        }
        if(y[0][0]==0 ){
          if (y[1][1]==0 ){
            if (y[2][2]==0 ){
                v=0;
        }
        }
        }
         if( y[0][0]==1){
          if ( y[1][1]==1){
            if ( y[2][2]==1){
                v=0;
        }
        }
        }
        
    }
  }
  return v;
}


int main(){
    int l=1;
    int b=1;
    string z[2];
    int c;
    int x[3][3]={{10,2,3},{4,5,6},{7,8,9}};
    cout<<"enter player1 name";
    cin>>z[0];
    cout<<"enter player2 name";
    cin>>z[1];
    for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
      cout<<x[i][j];
   }
   cout<<endl;
   }
   int s=1;
   while(s!=0 && b<10){
    if (b%2!=0){ 
      cout<<z[0]<<" enter a value ";
      cin>>c;
      b++;
     change(c,x,b); 
    }
    else{
        cout<<z[1]<<" enter a value ";
        cin>>c; 
        b++;
        change(c,x,b);  
    }
   s=win(x);
     }
   if (b<10){
   if(b%2!=0){
    cout<<z[1]<<"win";
   }
   else{
    cout<<z[0]<<"win";
   }
   }
   else{
    cout<<"no winner";
   }
}