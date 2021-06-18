FROM mcr.microsoft.com/dotnet/core/sdk:2.2
ADD HotelReservationSystem/* /HotelReservationSystem/
ADD HotelReservationSystemTypes/* /HotelReservationSystemTypes/
RUN dotnet restore /HotelReservationSystem/HotelReservationSystem.csproj
COPY HotelReservationSystem.sln /
WORKDIR /HotelReservationSystem/
RUN dotnet build HotelReservationSystem.csproj -c Release -o /app && dotnet publish HotelReservationSystem.csproj -c Release -o /app
EXPOSE 8080
WORKDIR /app/
CMD dotnet HotelReservationSystem.dll