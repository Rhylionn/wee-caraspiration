<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="statistics.aspx.cs" Inherits="admin_statistics" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <div class="head-container">
        <h1>Statistics</h1>
    </div>
    <div style="margin-top: 20px; display: flex; justify-content: space-around; flex-wrap: wrap; gap: 10px;">
        <div class="graph-container">
            <h2>Autonomy by model</h2>
            <div>
                <asp:Chart ID="Chart1" runat="server" DataSourceID="autonomyByModel" Height="400px" Palette="SeaGreen"
                    Width="400px">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="model" YValueMembers="autonomy"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisY Title="Kilometers"></AxisY>
                            <AxisX Title="Models"></AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>

                <asp:SqlDataSource ID="autonomyByModel" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [model], [autonomy] 
                            FROM [Cars] 
                            ORDER BY [autonomy] DESC">
                </asp:SqlDataSource>
            </div>
        </div>


        <div class="graph-container">
            <h2>Power by model</h2>
            <asp:Chart ID="Chart2" runat="server" DataSourceID="powerByModel" Height="400px" Palette="Berry"
                Width="400px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="model" YValueMembers="power" ChartType="StackedColumn"
                        YValuesPerPoint="2"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Horse Power"></AxisY>
                        <AxisX Title="Models"></AxisX>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <asp:SqlDataSource ID="powerByModel" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [model], [power] 
                            FROM [Cars] 
                            ORDER BY [power] DESC">
            </asp:SqlDataSource>
        </div>


        <div class="graph-container">
            <h2>Prices by model</h2>
            <asp:Chart ID="Chart3" runat="server" DataSourceID="pricesByModel" Height="400px" Palette="EarthTones"
                Width="400px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="model" YValueMembers="price" ChartType="StackedColumn">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Price"></AxisY>
                        <AxisX Title="Model"></AxisX>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <asp:SqlDataSource ID="pricesByModel" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT rentals.price AS price, Cars.model AS model 
                            FROM Cars INNER JOIN rentals
                            ON Cars.Id = rentals.car_id 
                            ORDER BY price DESC">
            </asp:SqlDataSource>
        </div>


        <div class="graph-container">
            <h2>Number of cars by Range</h2>
            <asp:Chart ID="Chart5" runat="server" DataSourceID="rangeNumbers" Height="400px" Palette="SeaGreen"
                Width="400px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="Range" YValueMembers="Number" ChartType="Doughnut">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Quantity"></AxisY>
                        <AxisX Title="Range"></AxisX>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <asp:SqlDataSource ID="rangeNumbers" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT range AS Range, COUNT(*) AS Number 
                            FROM [Cars] 
                            GROUP BY range 
                            ORDER BY COUNT(*) DESC">
            </asp:SqlDataSource>
        </div>


        <div class="graph-container">
            <h2>Average price by range</h2>

            <asp:Chart ID="Chart4" runat="server" DataSourceID="averagePriceByRange" Height="400px"
                Palette="SemiTransparent" Width="400px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="range" YValueMembers="price" ChartType="StackedBar">
                    </asp:Series>
                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Price"></AxisY>
                        <AxisX Title="Range"></AxisX>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>


            <asp:SqlDataSource ID="averagePriceByRange" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AVG(rentals.price) AS price, Cars.range AS range
                            FROM Cars INNER JOIN rentals
                            ON Cars.Id = rentals.car_id
                            GROUP BY range
                            ORDER BY price desc">
            </asp:SqlDataSource>
        </div>


        <div class="graph-container">
            <h2>Average autonomy by range</h2>
            <asp:Chart ID="Chart7" runat="server" DataSourceID="averageAutonomyByRange" Height="400px" Palette="Berry"
                Width="400px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="range" YValueMembers="averageAutonomy" ChartType="Radar">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Autonomy"></AxisY>
                        <AxisX Title="Range"></AxisX>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <asp:SqlDataSource ID="averageAutonomyByRange" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AVG(autonomy) AS averageAutonomy, range
                                FROM Cars
                                GROUP BY range
                                ORDER BY averageAutonomy DESC">
            </asp:SqlDataSource>
        </div>


        <div class="graph-container">
            <h2>Average power by range</h2>

            <asp:Chart ID="Chart8" runat="server" DataSourceID="averagePowerByRange" Height="400px" Palette="SeaGreen"
                Width="400px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="range" YValueMembers="averagePower" ChartType="Radar">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="averagePowerByRange">
                        <AxisY Title="Horse power"></AxisY>
                        <AxisX Title="Range"></AxisX>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <asp:SqlDataSource ID="averagePowerByRange" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AVG(power) AS averagePower, range
                                FROM Cars
                                GROUP BY range
                                ORDER BY averagePower DESC">
            </asp:SqlDataSource>
        </div>


        <div class="graph-container">
            <h2>Average autonomy by type of energy</h2>
            <asp:Chart ID="Chart6" runat="server" DataSourceID="averageAutonomyByEnergy" Height="400px" Palette="Pastel"
                Width="400px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="energy" YValueMembers="averageAutonomy"
                        ChartType="StackedColumn"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Autonomy"></AxisY>
                        <AxisX Title="Energy"></AxisX>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <asp:SqlDataSource ID="averageAutonomyByEnergy" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AVG(autonomy) AS averageAutonomy, energy
                                FROM Cars
                                GROUP BY energy
                                ORDER BY averageAutonomy DESC">
            </asp:SqlDataSource>
        </div>


        <div class="graph-container">
            <h2>Average power by type of energy</h2>
            <asp:Chart ID="Chart9" runat="server" DataSourceID="averagePowerByEnergy" Height="400px" Palette="SeaGreen"
                Width="400px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="energy" YValueMembers="averagePower" ChartType="Radar"
                        YValuesPerPoint="6"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Horse power"></AxisY>
                        <AxisX Title="Energy"></AxisX>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <asp:SqlDataSource ID="averagePowerByEnergy" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AVG(power) AS averagePower, energy
                                FROM Cars
                                GROUP BY energy
                                ORDER BY averagePower DESC">
            </asp:SqlDataSource>
        </div>


        <div class="graph-container">
            <h2>Number of cars by brand</h2>
            <asp:Chart ID="Chart10" runat="server" DataSourceID="numberOfCarsByBrand" Height="400px" Palette="Chocolate"
                Width="400px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="brand" YValueMembers="numberOfBrands" ChartType="Pie">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Number of cars"></AxisY>
                        <AxisX Title="Brands"></AxisX>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <asp:SqlDataSource ID="numberOfCarsByBrand" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT COUNT(brand) AS numberOfBrands, brand
                                FROM Cars
                                GROUP BY brand
                                ORDER BY COUNT(brand) DESC">
            </asp:SqlDataSource>
        </div>


        <div class="graph-container">
            <h2>Power by autonomy</h2>
            <asp:Chart ID="Chart11" runat="server" DataSourceID="powerByAutonomy" Height="400px" Palette="Fire"
                Width="400px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="power" YValueMembers="autonomy" ChartType="StackedColumn">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Autonomy"></AxisY>
                        <AxisX Title="Horse power"></AxisX>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <asp:SqlDataSource ID="powerByAutonomy" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT power, autonomy
                                FROM Cars
                                ORDER BY autonomy DESC">
            </asp:SqlDataSource>
        </div>
    </div>

    <div style="margin: 20px 0 20px; display: flex;justify-content: space-around;">
        <div class="stat-container">
        <h2>Cars and rentals</h2><u>Number of Cars:</u>
        
        <asp:Label ID="numberOfCars" runat="server" Text=""></asp:Label>

        <br />
            <u>Number of rentals:</u>
        
        <asp:Label ID="numberOfRentals" runat="server" Text=""></asp:Label>

        <br />
            <u>Number of users renting:</u>
        
        <asp:Label ID="numberOfUsersRenting" runat="server" Text=""></asp:Label>

        <br />
<u>Number of cars rented:</u>
        
        <asp:Label ID="numberOfCarsRented" runat="server" Text=""></asp:Label>
    </div>
        
<div class="stat-container">
        <h2>Prices</h2>
<u>Average rental price:</u>
        
        <asp:Label ID="averagePrice" runat="server" Text=""></asp:Label> $

        <br />
<u>Max rental price:</u>
        
        <asp:Label ID="maxPrice" runat="server" Text=""></asp:Label> $

        <br />
<u>Min rental price:</u>
        
        <asp:Label ID="minPrice" runat="server" Text=""></asp:Label> $

        </div>
        <div class="stat-container">
        <h2>Moderation</h2>
        <u>Number of all online users:</u>
        
        <asp:Label ID="numberOfUsers" runat="server" Text=""></asp:Label>

        <br />
<u>Number of admins:</u>
        
        <asp:Label ID="numberOfAdmins" runat="server" Text=""></asp:Label>
    </div>
</div>

    <asp:Label class="success-msg" ID="errorMessage" runat="server" Text=""></asp:Label>


</asp:Content>