function  DisplayVideo( Data1, Data2, Data3, Data4, imSize, VideoName )


writerObj = VideoWriter(VideoName); % Name it.
writerObj.FrameRate = 15; % How many frames per second.
open(writerObj); 
figure;

for i = 1: size(Data1,2)
    
   img1 = Data1(:,i);
   img1 = reshape(img1,imSize);
   
   img2 = Data2(:,i);
   img2 = reshape(img2,imSize);
    
   img3 = Data3(:,i);
   img3 = reshape(img3, imSize);
   
   img4 = Data4(:,i);
   img4 = reshape(img4, imSize);
    
    
    h = subplot('position',[0.01,0.50,0.47, 0.42]);
    imshow(uint8(img1));
    title('original')
      
    h = subplot('position',[0.49,0.50,0.47, 0.42]);
    imshow(uint8(img2));
    title('noisy')
    
    h = subplot('position',[0.01,0.001,0.47, 0.42]);
    imshow(uint8(img3));
    title('ReLD')
    
    h = subplot('position',[0.49,0.001,0.47, 0.42]);
    imshow(uint8(img4));
    title('BM3D')
    
      
       frame = getframe(gcf); % 'gcf' can handle if you zoom in to take a movie.
        writeVideo(writerObj, frame);
   
    
end

hold off
close(writerObj);

