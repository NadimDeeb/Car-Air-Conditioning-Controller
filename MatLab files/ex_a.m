%a)------------------------------------------------------------------------
num=[25];
denom=[1 12 40];
SYS=tf(num,denom)
figure(1)
hold on
step(SYS)
hold off
%b-2)----------------------------------------------------------------------
num_2=[1960];
denom_2=[1 12 2000];
sys_2=tf(num_2,denom_2)
figure(2)
hold on
step(sys_2)
hold off
%c-2)----------------------------------------------------------------------
for k=78.4:100
    figure(3)
    hold on
    num_3=[1.25*k 25*k];
    denom_3=[1 12+1.25*k 40+25*k];
    sys_3=tf(num_3,denom_3);
    step(sys_3)
end
hold off
%d)------------------------------------------------------------------------
num_4=[1.25 25 25];
denom_4=[1 13.25 65 25];
sys_4=tf(num_4,denom_4)
figure(4)
step(sys_4)
%e-1)----------------------------------------------------------------------
num_5=[100 2000 10000];
denom_5=[1 112 2040 10000];
sys_5=tf(num_5,denom_5)
figure(5)
step(sys_5)
stepinfo(sys_5) %gets you risetime and overshoot
%e-2)----------------------------------------------------------------------
figure(6)
hold on
bode(sys_5)%H=Y/R
hold off

num_6=[100 2000 10000];
denom_6=[1 12 40 0];
sys_6=tf(num_6,denom_6)
figure(7)
hold on
bode(sys_6)%open loop
hold off

num_7=[1 12 40 0];
denom_7=[1 112 2040 10000];
sys_7=tf(num_7,denom_7)
figure (8)
hold on
bode(sys_7)%H=Y/D
hold off

num_8=[-100 -2000 -10000];
denom_8=[1 112 2040 10000];
sys_8=tf(num_8,denom_8)
figure(9)
hold on
bode(sys_8)%H=Y/N
hold off
%e-3)----------------------------------------------------------------------
load("data_proj_matlab.mat","d","n","time_vec");

figure(10)
hold on
lsim(sys_8,n,time_vec)
hold off

figure(11)
hold on
lsim(sys_7,d,time_vec)
hold off

figure(12)
hold on
step(sys_5,time_vec)
hold off

plot(time_vec, step(sys_5,time_vec)+lsim(sys_7,d,time_vec)+lsim(sys_8,n,time_vec))
%e-4)----------------------------------------------------------------------
num_9=[10 200 1000];
denom_9=[1 22 240 1000];
sys_9=tf(num_9,denom_9)%H=Y/R
figure(13)
hold on
step(sys_9)
hold off
stepinfo(sys_9)

num_10=[1 12 40];
denom_10=[1 22 240 1000];
sys_10=tf(num_10,denom_10)
figure(14)
hold on
lsim(sys_10,d,time_vec)%H=Y/D
hold off

num_11=[-10 -200 -1000];
denom_11=[1 22 240 1000];
sys_11=tf(num_11,denom_11)
figure(15)
hold on
lsim(sys_11,n,time_vec)%H=Y/N
hold off



