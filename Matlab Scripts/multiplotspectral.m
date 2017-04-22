I=13.6;
U=20;
% K=5:1:50;
% K=5;

x=0:0.1:30;
y1=zeros(length(x));
y2=zeros(length(x));
y3=zeros(length(x));

f1=real(FK(I,U,K,2*I,x));
f2=imag(FK(I,U,K,2*I,x));
f3=B2(x);
    figure
    subplot(2,2,1)       % add first plot in 2 x 2 grid
    plot(x,y1)           % line plot
    title('Subplot 1')

    subplot(2,2,2)       % add second plot in 2 x 2 grid
    plot(x,y2)        % scatter plot
    title('Subplot 2')

    subplot(2,2,3)       % add third plot in 2 x 2 grid
    plot(x,y3)           % stem plot
    title('Subplot 3')

    subplot(2,2,4)       % add fourth plot in 2 x 2 grid
    yyaxis left          % plot against left y-axis  
    plot(x,y1)           
    yyaxis right         % plot against right y-axis
    plot(x,y2)
    title('Subplot 4')



% for K=10:30:310
%     for t=0:length(x)-1
%         y1(t+1)=real(FK(I,U,K,2*I,t));
%         y2(t+1)=imag(FK(I,U,K,2*I,t));
%         y3(t+1)=B2(t);
% 
%     end
%     
%     figure
%     subplot(2,2,1)       % add first plot in 2 x 2 grid
%     plot(x,y1)           % line plot
%     title('Subplot 1')
% 
%     subplot(2,2,2)       % add second plot in 2 x 2 grid
%     plot(x,y2)        % scatter plot
%     title('Subplot 2')
% 
%     subplot(2,2,3)       % add third plot in 2 x 2 grid
%     plot(x,y3)           % stem plot
%     title('Subplot 3')
% 
%     subplot(2,2,4)       % add fourth plot in 2 x 2 grid
%     yyaxis left          % plot against left y-axis  
%     plot(x,y1)           
%     yyaxis right         % plot against right y-axis
%     plot(x,y2)
%     title('Subplot 4')
%     %     plot(x,y1)
%     % plot(x,y2)
%     % hold all
% end

