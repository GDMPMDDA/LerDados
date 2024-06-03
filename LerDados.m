

clc,clear all

days=[31 28 31 30 31 30 31 31 30 31 30 31];

t=0;
for j=1:1 %indicar os meses
month=1+(j-1);
for jj=1:days(j)       
for k=0:6:18       
hour=k;
filename=['gdas1.fnl0p25.2024' strcat(sprintf('%02d',month)) strcat(sprintf('%02d',jj)) strcat(sprintf('%02d',hour)) '.f00.grib2.nc']
t=t+1;

%Read the header
ncdisp(filename);
%surf_temp

%Open the file in read only mode;
ncid=netcdf.open(filename,'NOWRITE');

Altura=ncread(filename,'HGT_L100');
Temperatura=ncread(filename,'TMP_L100');
VelocidadeU=ncread(filename,'U_GRD_L100');
VelocidadeV=ncread(filename,'V_GRD_L100');


Temp_1000(t)= Temperatura(1,1,1,1);
Temp_975(t)= Temperatura(1,1,2,1);
Temp_950(t)= Temperatura(1,1,3,1);
Temp_900(t)= Temperatura(1,1,4,1);
Temp_800(t)= Temperatura(1,1,5,1);
Temp_700(t)= Temperatura(1,1,6,1);
Temp_600(t)= Temperatura(1,1,7,1);
Temp_500(t)= Temperatura(1,1,8,1);
Temp_400(t)= Temperatura(1,1,9,1);
Temp_300(t)= Temperatura(1,1,10,1);


VelU_1000(t)= VelocidadeU(1,1,1,1);
VelU_975(t)= VelocidadeU(1,1,2,1);
VelU_950(t)= VelocidadeU(1,1,3,1);
VelU_900(t)= VelocidadeU(1,1,4,1);
VelU_800(t)= VelocidadeU(1,1,5,1);
VelU_700(t)= VelocidadeU(1,1,6,1);
VelU_600(t)= VelocidadeU(1,1,7,1);
VelU_500(t)= VelocidadeU(1,1,8,1);
VelU_400(t)= VelocidadeU(1,1,9,1);
VelU_300(t)= VelocidadeU(1,1,10,1);

VelV_1000(t)=VelocidadeV(1,1,1,1);
VelV_975(t)=VelocidadeV(1,1,2,1);
VelV_950(t)=VelocidadeV(1,1,3,1);
VelV_900(t)=VelocidadeV(1,1,4,1);
VelV_800(t)=VelocidadeV(1,1,5,1);
VelV_700(t)=VelocidadeV(1,1,6,1);
VelV_600(t)=VelocidadeV(1,1,7,1);
VelV_500(t)=VelocidadeV(1,1,8,1);
VelV_400(t)=VelocidadeV(1,1,9,1);
VelV_300(t)=VelocidadeV(1,1,10,1);

H_1000(t)=Altura(1,1,1,1);
H_975(t)=Altura(1,1,2,1);
H_950(t)=Altura(1,1,3,1);
H_900(t)=Altura(1,1,4,1);
H_800(t)=Altura(1,1,5,1);
H_700(t)=Altura(1,1,6,1);
H_600(t)=Altura(1,1,7,1);
H_500(t)=Altura(1,1,8,1);
H_400(t)=Altura(1,1,9,1);
H_300(t)=Altura(1,1,10,1);

Mes(t)= month;
Dia(t)= jj;
Hora(t)=hour;
end
end 
end


%Magnitude da velocidade
for t=1:124
    MagVel_1000(t)=sqrt((VelU_1000(t)^2)+(VelV_1000(t)^2));
    MagVel_975(t)=sqrt((VelU_975(t)^2)+(VelV_975(t)^2));
    MagVel_950(t)=sqrt((VelU_950(t)^2)+(VelV_950(t)^2));
    MagVel_900(t)=sqrt((VelU_900(t)^2)+(VelV_900(t)^2));
    MagVel_800(t)=sqrt((VelU_800(t)^2)+(VelV_800(t)^2));
    MagVel_700(t)=sqrt((VelU_700(t)^2)+(VelV_700(t)^2));
    MagVel_600(t)=sqrt((VelU_600(t)^2)+(VelV_600(t)^2));
    MagVel_500(t)=sqrt((VelU_500(t)^2)+(VelV_500(t)^2));
    MagVel_400(t)=sqrt((VelU_400(t)^2)+(VelV_400(t)^2));
    MagVel_300(t)=sqrt((VelU_300(t)^2)+(VelV_300(t)^2));
end

%Direção em graus
for t=1:124
    %Level 1000hPa
    if VelU_1000(t)> 0.0 && VelV_1000(t)> 0.0 
    Dir_1000(t)= 180+((180/3.14)*atan(abs(VelU_1000(t))/abs(VelV_1000(t))));
    end
    if VelU_1000(t)> 0.0 && VelV_1000(t)< 0.0 
    Dir_1000(t)= 270+((180/3.14)*atan(abs(VelV_1000(t))/abs(VelU_1000(t))));
    end
    if VelU_1000(t)< 0.0 && VelV_1000(t)< 0.0 
    Dir_1000(t)= ((180/3.14)*atan(abs(VelU_1000(t))/abs(VelV_1000(t))));
    end
    if VelU_1000(t)< 0.0 && VelV_1000(t)> 0.0 
    Dir_1000(t)= 90+((180/3.14)*atan(abs(VelV_1000(t))/abs(VelU_1000(t))));
    end
    
    %Level 975hPa
    if VelU_975(t)> 0.0 && VelV_975(t)> 0.0 
    Dir_975(t)= 180+((180/3.14)*atan(abs(VelU_975(t))/abs(VelV_975(t))));
    end
    if VelU_975(t)> 0.0 && VelV_975(t)< 0.0 
    Dir_975(t)= 270+((180/3.14)*atan(abs(VelV_975(t))/abs(VelU_975(t))));
    end
    if VelU_975(t)< 0.0 && VelV_975(t)< 0.0 
    Dir_975(t)= ((180/3.14)*atan(abs(VelU_975(t))/abs(VelV_975(t))));
    end
    if VelU_975(t)< 0.0 && VelV_975(t)> 0.0 
    Dir_975(t)= 90+((180/3.14)*atan(abs(VelV_975(t))/abs(VelU_975(t))));
    end
    
    %Leval 950hPa
    if VelU_950(t)> 0.0 && VelV_950(t)> 0.0
    Dir_950(t)= 180+((180/3.14)*atan(abs(VelU_950(t))/abs(VelV_950(t))));
    end
    if VelU_950(t)> 0.0 && VelV_950(t)< 0.0 
    Dir_950(t)= 270+((180/3.14)*atan(abs(VelV_950(t))/abs(VelU_950(t))));
    end
    if VelU_950(t)< 0.0 && VelV_950(t)< 0.0 
    Dir_950(t)= ((180/3.14)*atan(abs(VelU_950(t))/abs(VelV_950(t))));
    end
    if VelU_950(t)< 0.0 && VelV_950(t)> 0.0 
    Dir_950(t)= 90+((180/3.14)*atan(abs(VelV_950(t))/abs(VelU_950(t))));
    end
    
    %Level 900hPa
    if VelU_900(t)> 0.0 && VelV_900(t)> 0.0 
    Dir_900(t)= 180+((180/3.14)*atan(abs(VelU_900(t))/abs(VelV_900(t))));
    end
    if VelU_900(t)> 0.0 && VelV_900(t)< 0.0 
    Dir_900(t)= 270+((180/3.14)*atan(abs(VelV_900(t))/abs(VelU_900(t))));
    end
    if VelU_900(t)< 0.0 && VelV_900(t)< 0.0 
    Dir_900(t)= ((180/3.14)*atan(abs(VelU_900(t))/abs(VelV_900(t))));
    end
    if VelU_900(t)< 0.0 && VelV_900(t)> 0.0 
    Dir_900(t)= 90+((180/3.14)*atan(abs(VelV_900(t))/abs(VelU_900(t))));
    end
    
    %Level 800hPa
    if VelU_800(t)> 0.0 && VelV_800(t)> 0.0 
    Dir_800(t)= 180+((180/3.14)*atan(abs(VelU_800(t))/abs(VelV_800(t))));
    end
    if VelU_800(t)> 0.0 && VelV_800(t)< 0.0 
    Dir_800(t)= 270+((180/3.14)*atan(abs(VelV_800(t))/abs(VelU_800(t))));
    end
    if VelU_800(t)< 0.0 && VelV_800(t)< 0.0 
    Dir_800(t)= ((180/3.14)*atan(abs(VelU_800(t))/abs(VelV_800(t))));
    end
    if VelU_800(t)< 0.0 && VelV_800(t)> 0.0 
    Dir_800(t)= 90+((180/3.14)*atan(abs(VelV_800(t))/abs(VelU_800(t))));
    end  
    
    %Level 700hPa
    if VelU_700(t)> 0.0 && VelV_700(t)> 0.0 
    Dir_700(t)= 180+((180/3.14)*atan(abs(VelU_700(t))/abs(VelV_700(t))));
    end
    if VelU_700(t)> 0.0 && VelV_700(t)< 0.0 
    Dir_700(t)= 270+((180/3.14)*atan(abs(VelV_700(t))/abs(VelU_700(t))));
    end
    if VelU_700(t)< 0.0 && VelV_700(t)< 0.0 
    Dir_700(t)= ((180/3.14)*atan(abs(VelU_700(t))/abs(VelV_700(t))));
    end
    if VelU_700(t)< 0.0 && VelV_700(t)> 0.0 
    Dir_700(t)= 90+((180/3.14)*atan(abs(VelV_700(t))/abs(VelU_700(t))));
    end   
    
    %Level 600hPa
    if VelU_600(t)> 0.0 && VelV_600(t)> 0.0 
    Dir_600(t)= 180+((180/3.14)*atan(abs(VelU_600(t))/abs(VelV_600(t))));
    end
    if VelU_600(t)> 0.0 && VelV_600(t)< 0.0 
    Dir_600(t)= 270+((180/3.14)*atan(abs(VelV_600(t))/abs(VelU_600(t))));
    end
    if VelU_600(t)< 0.0 && VelV_600(t)< 0.0 
    Dir_600(t)= ((180/3.14)*atan(abs(VelU_600(t))/abs(VelV_600(t))));
    end
    if VelU_600(t)< 0.0 && VelV_600(t)> 0.0 
    Dir_600(t)= 90+((180/3.14)*atan(abs(VelV_600(t))/abs(VelU_600(t))));
    end
    
    %Level 500hPa
    if VelU_500(t)> 0.0 && VelV_500(t)> 0.0 
    Dir_500(t)= 180+((180/3.14)*atan(abs(VelU_500(t))/abs(VelV_500(t))));
    end
    if VelU_500(t)> 0.0 && VelV_500(t)< 0.0 
    Dir_500(t)= 270+((180/3.14)*atan(abs(VelV_500(t))/abs(VelU_500(t))));
    end
    if VelU_500(t)< 0.0 && VelV_500(t)< 0.0 
    Dir_500(t)= ((180/3.14)*atan(abs(VelU_500(t))/abs(VelV_500(t))));
    end
    if VelU_500(t)< 0.0 && VelV_500(t)> 0.0 
    Dir_500(t)= 90+((180/3.14)*atan(abs(VelV_500(t))/abs(VelU_500(t))));
    end   
    
    %Level 400hPa
    if VelU_400(t)> 0.0 && VelV_400(t)> 0.0 
    Dir_400(t)= 180+((180/3.14)*atan(abs(VelU_400(t))/abs(VelV_400(t))));
    end
    if VelU_400(t)> 0.0 && VelV_400(t)< 0.0 
    Dir_400(t)= 270+((180/3.14)*atan(abs(VelV_400(t))/abs(VelU_400(t))));
    end
    if VelU_400(t)< 0.0 && VelV_400(t)< 0.0 
    Dir_400(t)= ((180/3.14)*atan(abs(VelU_400(t))/abs(VelV_400(t))));
    end
    if VelU_400(t)< 0.0 && VelV_400(t)> 0.0 
    Dir_400(t)= 90+((180/3.14)*atan(abs(VelV_400(t))/abs(VelU_400(t))));
    end   
    
    %Level 300hPa
    if VelU_300(t)> 0.0 && VelV_300(t)> 0.0 
    Dir_300(t)= 180+((180/3.14)*atan(abs(VelU_300(t))/abs(VelV_300(t))));
    end
    if VelU_300(t)> 0.0 && VelV_300(t)< 0.0 
    Dir_300(t)= 270+((180/3.14)*atan(abs(VelV_300(t))/abs(VelU_300(t))));
    end
    if VelU_300(t)< 0.0 && VelV_300(t)< 0.0 
    Dir_300(t)= ((180/3.14)*atan(abs(VelU_300(t))/abs(VelV_300(t))));
    end
    if VelU_300(t)< 0.0 && VelV_300(t)> 0.0 
    Dir_300(t)= 90+((180/3.14)*atan(abs(VelV_300(t))/abs(VelU_300(t))));
    end   
end



save('VelocidadeU.mat','VelU_1000','VelU_975','VelU_950','VelU_900','VelU_800','VelU_700','VelU_600','VelU_500','VelU_400','VelU_300')
save('VelocidadeV.mat','VelV_1000','VelV_975','VelV_950','VelV_900','VelV_800','VelV_700','VelV_600','VelV_500','VelV_400','VelV_300')
save('Temperatura.mat','Temp_1000','Temp_975','Temp_950','Temp_900','Temp_800','Temp_700','Temp_600','Temp_500','Temp_400','Temp_300')
save('Altura.mat','H_1000','H_975','H_950','H_900','H_800','H_700','H_600','H_500','H_400','H_300')
save('MagnitudeVelocidade.mat','MagVel_1000','MagVel_975','MagVel_950','MagVel_900','MagVel_800','MagVel_700','MagVel_600','MagVel_500','MagVel_400','MagVel_300')
save('Direcao.mat','Dir_1000','Dir_975','Dir_950','Dir_900','Dir_800','Dir_700','Dir_600','Dir_500','Dir_400','Dir_300')  
  

save('Data.mat','Mes', 'Dia', 'Hora')

