#!/bin/bash
cd /home/docker/buildOutput
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.scada2194.munich0.corp.contoso:/app/Logs -w /app/buildOutput --name scada2194.munich0.corp.contoso -h scada2194.munich0.corp.contoso --network munich0.corp.contoso --restart always --expose 51210 simulation:latest ../buildOutput/Station.dll scada2194 opc.tcp://scada2194.munich0.corp.contoso:51210/ua/munich/productionline0/assemblystation 200 6 yes
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.scada1634.munich0.corp.contoso:/app/Logs -w /app/buildOutput --name scada1634.munich0.corp.contoso -h scada1634.munich0.corp.contoso --network munich0.corp.contoso --restart always --expose 51210 simulation:latest ../buildOutput/Station.dll scada1634 opc.tcp://scada1634.munich0.corp.contoso:51210/ua/munich/productionline0/teststation 100 6 no
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.scada8344.munich0.corp.contoso:/app/Logs -w /app/buildOutput --name scada8344.munich0.corp.contoso -h scada8344.munich0.corp.contoso --network munich0.corp.contoso --restart always --expose 51214 simulation:latest ../buildOutput/Station.dll scada8344 opc.tcp://scada8344.munich0.corp.contoso:51214/ua/munich/productionline0/packagingstation 100 6 no
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/MES.Mes0254.munich0.corp.contoso:/app/Logs -v /home/docker/Config/MES.Mes0254.munich0.corp.contoso:/app/Config -w /app/Config --name mes0254.munich0.corp.contoso -h mes0254.munich0.corp.contoso --network munich0.corp.contoso --restart always simulation:latest ../buildOutput/MES.dll
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.scadacp008.capetown.corp.contoso:/app/Logs -w /app/buildOutput --name scadacp008.capetown.corp.contoso -h scadacp008.capetown.corp.contoso --network capetown.corp.contoso --restart always --expose 51210 simulation:latest ../buildOutput/Station.dll scadacp008 opc.tcp://scadacp008.capetown.corp.contoso:51210/ua/capetown/productionline0/assemblystation 200 8 yes
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.cptw1634.capetown.corp.contoso:/app/Logs -w /app/buildOutput --name cptw1634.capetown.corp.contoso -h cptw1634.capetown.corp.contoso --network capetown.corp.contoso --restart always --expose 51210 simulation:latest ../buildOutput/Station.dll cptw1634 opc.tcp://cptw1634.capetown.corp.contoso:51210/ua/capetown/productionline0/teststation 100 8 no
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.scada1144.capetown.corp.contoso:/app/Logs -w /app/buildOutput --name scada1144.capetown.corp.contoso -h scada1144.capetown.corp.contoso --network capetown.corp.contoso --restart always --expose 51214 simulation:latest ../buildOutput/Station.dll scada1144 opc.tcp://scada1144.capetown.corp.contoso:51214/ua/capetown/productionline0/packagingstation 100 8 no
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/MES.Mes3221.capetown.corp.contoso:/app/Logs -v /home/docker/Config/MES.Mes3221.capetown.corp.contoso:/app/Config -w /app/Config --name mes3221.capetown.corp.contoso -h mes3221.capetown.corp.contoso --network capetown.corp.contoso --restart always simulation:latest ../buildOutput/MES.dll
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.scadacp008.mumbai.corp.contoso:/app/Logs -w /app/buildOutput --name scadacp008.mumbai.corp.contoso -h scadacp008.mumbai.corp.contoso --network mumbai.corp.contoso --restart always --expose 51210 simulation:latest ../buildOutput/Station.dll scadacp008 opc.tcp://scadacp008.mumbai.corp.contoso:51210/ua/mumbai/line1/assemblystation 200 11 yes
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.cptw1634.mumbai.corp.contoso:/app/Logs -w /app/buildOutput --name cptw1634.mumbai.corp.contoso -h cptw1634.mumbai.corp.contoso --network mumbai.corp.contoso --restart always --expose 51210 simulation:latest ../buildOutput/Station.dll cptw1634 opc.tcp://cptw1634.mumbai.corp.contoso:51210/ua/mumbai/line1/teststation 100 11 no
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.scada1144.mumbai.corp.contoso:/app/Logs -w /app/buildOutput --name scada1144.mumbai.corp.contoso -h scada1144.mumbai.corp.contoso --network mumbai.corp.contoso --restart always --expose 51214 simulation:latest ../buildOutput/Station.dll scada1144 opc.tcp://scada1144.mumbai.corp.contoso:51214/ua/mumbai/line1/packagingstation 100 11 no
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/MES.Mes3221.mumbai.corp.contoso:/app/Logs -v /home/docker/Config/MES.Mes3221.mumbai.corp.contoso:/app/Config -w /app/Config --name mes3221.mumbai.corp.contoso -h mes3221.mumbai.corp.contoso --network mumbai.corp.contoso --restart always simulation:latest ../buildOutput/MES.dll
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.sea103.seattle.corp.contoso:/app/Logs -w /app/buildOutput --name sea103.seattle.corp.contoso -h sea103.seattle.corp.contoso --network seattle.corp.contoso --restart always --expose 51210 simulation:latest ../buildOutput/Station.dll sea103 opc.tcp://sea103.seattle.corp.contoso:51210/ua/seattle/line1/assemblystation 200 6 yes
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.sea102.seattle.corp.contoso:/app/Logs -w /app/buildOutput --name sea102.seattle.corp.contoso -h sea102.seattle.corp.contoso --network seattle.corp.contoso --restart always --expose 51210 simulation:latest ../buildOutput/Station.dll sea102 opc.tcp://sea102.seattle.corp.contoso:51210/ua/seattle/line1/teststation 100 6 no
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.sea101.seattle.corp.contoso:/app/Logs -w /app/buildOutput --name sea101.seattle.corp.contoso -h sea101.seattle.corp.contoso --network seattle.corp.contoso --restart always --expose 51214 simulation:latest ../buildOutput/Station.dll sea101 opc.tcp://sea101.seattle.corp.contoso:51214/ua/seattle/line1/packagingstation 100 6 no
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/MES.sea001.seattle.corp.contoso:/app/Logs -v /home/docker/Config/MES.sea001.seattle.corp.contoso:/app/Config -w /app/Config --name sea001.seattle.corp.contoso -h sea001.seattle.corp.contoso --network seattle.corp.contoso --restart always simulation:latest ../buildOutput/MES.dll
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.beijing103.beijing.corp.contoso:/app/Logs -w /app/buildOutput --name beijing103.beijing.corp.contoso -h beijing103.beijing.corp.contoso --network beijing.corp.contoso --restart always --expose 51210 simulation:latest ../buildOutput/Station.dll beijing103 opc.tcp://beijing103.beijing.corp.contoso:51210/ua/beijing/line1/assemblystation 200 9 yes
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.beijing102.beijing.corp.contoso:/app/Logs -w /app/buildOutput --name beijing102.beijing.corp.contoso -h beijing102.beijing.corp.contoso --network beijing.corp.contoso --restart always --expose 51210 simulation:latest ../buildOutput/Station.dll beijing102 opc.tcp://beijing102.beijing.corp.contoso:51210/ua/beijing/line1/teststation 100 9 no
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.beijing101.beijing.corp.contoso:/app/Logs -w /app/buildOutput --name beijing101.beijing.corp.contoso -h beijing101.beijing.corp.contoso --network beijing.corp.contoso --restart always --expose 51214 simulation:latest ../buildOutput/Station.dll beijing101 opc.tcp://beijing101.beijing.corp.contoso:51214/ua/beijing/line1/packagingstation 100 9 no
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/MES.beijing001.beijing.corp.contoso:/app/Logs -v /home/docker/Config/MES.beijing001.beijing.corp.contoso:/app/Config -w /app/Config --name beijing001.beijing.corp.contoso -h beijing001.beijing.corp.contoso --network beijing.corp.contoso --restart always simulation:latest ../buildOutput/MES.dll
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.beijing201.beijing.corp.contoso:/app/Logs -w /app/buildOutput --name beijing201.beijing.corp.contoso -h beijing201.beijing.corp.contoso --network beijing.corp.contoso --restart always --expose 51210 simulation:latest ../buildOutput/Station.dll beijing201 opc.tcp://beijing201.beijing.corp.contoso:51210/ua/beijing/pl2/assembly 200 8 yes
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.beijing202.beijing.corp.contoso:/app/Logs -w /app/buildOutput --name beijing202.beijing.corp.contoso -h beijing202.beijing.corp.contoso --network beijing.corp.contoso --restart always --expose 51210 simulation:latest ../buildOutput/Station.dll beijing202 opc.tcp://beijing202.beijing.corp.contoso:51210/ua/beijing/pl2/test 100 8 no
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.beijing203.beijing.corp.contoso:/app/Logs -w /app/buildOutput --name beijing203.beijing.corp.contoso -h beijing203.beijing.corp.contoso --network beijing.corp.contoso --restart always --expose 51214 simulation:latest ../buildOutput/Station.dll beijing203 opc.tcp://beijing203.beijing.corp.contoso:51214/ua/beijing/pl2/packaging 100 8 no
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/MES.beijing002.beijing.corp.contoso:/app/Logs -v /home/docker/Config/MES.beijing002.beijing.corp.contoso:/app/Config -w /app/Config --name beijing002.beijing.corp.contoso -h beijing002.beijing.corp.contoso --network beijing.corp.contoso --restart always simulation:latest ../buildOutput/MES.dll
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.beijing004.beijing.corp.contoso:/app/Logs -w /app/buildOutput --name beijing004.beijing.corp.contoso -h beijing004.beijing.corp.contoso --network beijing.corp.contoso --restart always --expose 51210 simulation:latest ../buildOutput/Station.dll beijing004 opc.tcp://beijing004.beijing.corp.contoso:51210/ua/beijing/prodline3/assembly 200 4 yes
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.beijing005.beijing.corp.contoso:/app/Logs -w /app/buildOutput --name beijing005.beijing.corp.contoso -h beijing005.beijing.corp.contoso --network beijing.corp.contoso --restart always --expose 51210 simulation:latest ../buildOutput/Station.dll beijing005 opc.tcp://beijing005.beijing.corp.contoso:51210/ua/beijing/prodline3/test 100 4 no
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.beijing006.beijing.corp.contoso:/app/Logs -w /app/buildOutput --name beijing006.beijing.corp.contoso -h beijing006.beijing.corp.contoso --network beijing.corp.contoso --restart always --expose 51214 simulation:latest ../buildOutput/Station.dll beijing006 opc.tcp://beijing006.beijing.corp.contoso:51214/ua/beijing/prodline3/packaging 100 4 no
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/MES.beijing003.beijing.corp.contoso:/app/Logs -v /home/docker/Config/MES.beijing003.beijing.corp.contoso:/app/Config -w /app/Config --name beijing003.beijing.corp.contoso -h beijing003.beijing.corp.contoso --network beijing.corp.contoso --restart always simulation:latest ../buildOutput/MES.dll
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.rio103.rio.corp.contoso:/app/Logs -w /app/buildOutput --name rio103.rio.corp.contoso -h rio103.rio.corp.contoso --network rio.corp.contoso --restart always --expose 51210 simulation:latest ../buildOutput/Station.dll rio103 opc.tcp://rio103.rio.corp.contoso:51210/ua/rio/line1/assemblystation 200 10 yes
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.rio102.rio.corp.contoso:/app/Logs -w /app/buildOutput --name rio102.rio.corp.contoso -h rio102.rio.corp.contoso --network rio.corp.contoso --restart always --expose 51210 simulation:latest ../buildOutput/Station.dll rio102 opc.tcp://rio102.rio.corp.contoso:51210/ua/rio/line1/teststation 100 10 no
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/Station.rio101.rio.corp.contoso:/app/Logs -w /app/buildOutput --name rio101.rio.corp.contoso -h rio101.rio.corp.contoso --network rio.corp.contoso --restart always --expose 51214 simulation:latest ../buildOutput/Station.dll rio101 opc.tcp://rio101.rio.corp.contoso:51214/ua/rio/line1/packagingstation 100 10 no
docker run -itd -v /home/docker/Shared:/app/Shared -v /home/docker/Logs/MES.rio001.rio.corp.contoso:/app/Logs -v /home/docker/Config/MES.rio001.rio.corp.contoso:/app/Config -w /app/Config --name rio001.rio.corp.contoso -h rio001.rio.corp.contoso --network rio.corp.contoso --restart always simulation:latest ../buildOutput/MES.dll
