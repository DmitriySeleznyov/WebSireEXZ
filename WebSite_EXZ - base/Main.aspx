<%@ Page Title="Система дистанционного мониторинга и управления ЭХЗ - Main" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Main.aspx.cs" Inherits="Main" %>

<%@ MasterType VirtualPath="~/Site.master" %>

<%@ Register Assembly="DevExpress.Web.v18.1" namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" tagprefix="dx" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
   
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server" CssClass="blockpicture" CssFilePath="~/Styles/MainpageCss.css" Height="500px" Width="19%" AlternateText="Для данного устройства нет изображения!" >
    </dx:ASPxBinaryImage>
    <dx:ASPxPageControl ID="ASPxPageControl2" runat="server" ActiveTabIndex="0" CssClass="blocktable" CssFilePath="~/Styles/MainpageCss.css" Theme="Youthful" Height="500px" Width="1060px">
        <tabpages>
            <dx:TabPage Text="Мониторинг">
                <contentcollection>
                    <dx:ContentControl runat="server">

                        <table>
                        <tr>
                        <td>
                        <table>
                        <tr>
                        <td>
                            <dx:ASPxGaugeControl ID="ASPxGaugeControl34" runat="server" BackColor="White" 
                                Height="20px" Value="3" Width="20px">
                                <Gauges>
                                    <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                        <indicators>
                                            <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                                Name="stateIndicatorComponent1" Size="200, 200" StateIndex="3">
                                                <states>
                                                    <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                    <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                    <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                    <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                </states>
                                            </dx:StateIndicatorComponent>
                                        </indicators>
                                    </dx:StateIndicatorGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            Включена<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl30" runat="server" 
                                BackColor="White" Height="20px" Value="3" Width="20px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                        <indicators>
                                            <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                                Name="stateIndicatorComponent1" Size="200, 200" StateIndex="3">
                                                <states>
                                                    <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                    <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                    <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                    <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                </states>
                                            </dx:StateIndicatorComponent>
                                        </indicators>
                                    </dx:StateIndicatorGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            Состояние связи<br /></td>
                        <td>

                            Последний опрос<br /> <dx:ASPxGaugeControl 
                                ID="ASPxGaugeControl35" runat="server" BackColor="White" Height="40px" 
                                Value="06.04.2017 19:58:17" Width="180px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 180, 40" DigitCount="15" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="06.04.2017 19:58:17">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="739.437561, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                        </td>
                        <td>
                            <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Опросить">
                            </dx:ASPxButton>
                        </td>
                        </tr>
                        </table>
                        <dx:ASPxPageControl ID="ASPxPageControl3" runat="server" ActiveTabIndex="0" 
                                Theme="Youthful">
                            <TabPages>
                                <dx:TabPage Text="Канал 1">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                        <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <table>
                                            <tr>
                                            <td>
                                                <dx:ASPxGaugeControl ID="ASPxGaugeControl31" runat="server" BackColor="White" 
                                                    Height="20px" Value="3" Width="20px">
                                                    <Gauges>
                                                        <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                                            <indicators>
                                                                <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                                                    Name="stateIndicatorComponent1" Size="200, 200" StateIndex="3">
                                                                    <states>
                                                                        <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                                        <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                                        <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                                        <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                                    </states>
                                                                </dx:StateIndicatorComponent>
                                                            </indicators>
                                                        </dx:StateIndicatorGauge>
                                                    </Gauges>
                                                    <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                                </dx:ASPxGaugeControl>
                                                Включен<br />Активный режим<dx:ASPxTextBox ID="ASPxTextBox1" runat="server" 
                                                Width="300px" Text="стабилизация по суммарному потенциалу">
                                            </dx:ASPxTextBox>
                                            </td>
                                            </tr>
                                            <tr>
                                            <td width="100%">
                                            <dx:ASPxGaugeControl ID="ASPxGaugeControl6" runat="server" BackColor="White" 
                                                Height="140px" LayoutInterval="6" Value="0.5" Width="140px">
                                                <Gauges>
                                                    <dx:CircularGauge Bounds="6, 6, 148, 148" Name="circularGauge10">
                                                        <scales>
                                                            <dx:ArcScaleComponent AcceptOrder="0" AppearanceTickmarkText-Font="Tahoma, 9pt" 
                                                                Center="125, 170" EndAngle="0" MajorTickCount="6" 
                                                                MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-6" 
                                                                MajorTickmark-ShapeType="Circular_Style25_1" MajorTickmark-TextOffset="-20" 
                                                                MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" 
                                                                MinorTickmark-ShapeOffset="-2" MinorTickmark-ShapeType="Circular_Style25_2" 
                                                                Name="scale1" RadiusX="95" RadiusY="95" StartAngle="-180" Value="1">
                                                                <ranges>
                                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#9EC968&quot;/&gt;" 
                                                                        EndThickness="2" EndValue="33" Name="Range0" ShapeOffset="11.5" 
                                                                        StartThickness="2" />
                                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FFDA80&quot;/&gt;" 
                                                                        EndThickness="2" EndValue="66" Name="Range1" ShapeOffset="11.5" 
                                                                        StartThickness="2" StartValue="33" />
                                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E99D9D&quot;/&gt;" 
                                                                        EndThickness="2" EndValue="100" Name="Range2" ShapeOffset="11.5" 
                                                                        StartThickness="2" StartValue="66" />
                                                                </ranges>
                                                            </dx:ArcScaleComponent>
                                                        </scales>
                                                        <backgroundlayers>
                                                            <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" 
                                                                ScaleCenterPos="0.5, 0.695" ScaleID="scale1" ShapeType="CircularHalf_Style25" 
                                                                Size="200, 145" ZOrder="1000" />
                                                        </backgroundlayers>
                                                        <needles>
                                                            <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="13" 
                                                                Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style25" 
                                                                StartOffset="-16.5" ZOrder="-50" />
                                                        </needles>
                                                        <markers>
                                                            <dx:ArcScaleMarkerComponent AcceptOrder="100" ArcScale="" 
                                                                Name="circularGauge10_Marker1" ScaleID="scale1" ZOrder="-100" />
                                                        </markers>
                                                        <spindlecaps>
                                                            <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                                                                Name="circularGauge10_SpindleCap1" ScaleID="scale1" 
                                                                ShapeType="CircularFull_Style25" Size="15, 15" ZOrder="-100" />
                                                        </spindlecaps>
                                                        <labels>
                                                            <dx:LabelComponent AcceptOrder="1001" Name="circularGauge10_Label1" 
                                                                Text="Напряжение, В" ZOrder="-1001" />
                                                        </labels>
                                                    </dx:CircularGauge>
                                                </Gauges>
                                                <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />

<LayoutPadding All="6" Left="6" Top="6" Right="6" Bottom="6"></LayoutPadding>
                                            </dx:ASPxGaugeControl>
                                            <dx:ASPxGaugeControl ID="ASPxGaugeControl7" runat="server" BackColor="White" 
                                                Height="140px" LayoutInterval="15" Value="50" Width="140px">
                                                <Gauges>
                                                    <dx:CircularGauge Bounds="6, 6, 148, 148" Name="circularGauge10">
                                                        <scales>
                                                            <dx:ArcScaleComponent AcceptOrder="0" AppearanceTickmarkText-Font="Tahoma, 9pt" 
                                                                Center="125, 170" EndAngle="0" MajorTickCount="6" 
                                                                MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-6" 
                                                                MajorTickmark-ShapeType="Circular_Style25_1" MajorTickmark-TextOffset="-20" 
                                                                MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" 
                                                                MinorTickmark-ShapeOffset="-2" MinorTickmark-ShapeType="Circular_Style25_2" 
                                                                Name="scale1" RadiusX="95" RadiusY="95" StartAngle="-180" Value="1">
                                                                <ranges>
                                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#9EC968&quot;/&gt;" 
                                                                        EndThickness="2" EndValue="33" Name="Range0" ShapeOffset="11.5" 
                                                                        StartThickness="2" />
                                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FFDA80&quot;/&gt;" 
                                                                        EndThickness="2" EndValue="66" Name="Range1" ShapeOffset="11.5" 
                                                                        StartThickness="2" StartValue="33" />
                                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E99D9D&quot;/&gt;" 
                                                                        EndThickness="2" EndValue="100" Name="Range2" ShapeOffset="11.5" 
                                                                        StartThickness="2" StartValue="66" />
                                                                </ranges>
                                                            </dx:ArcScaleComponent>
                                                        </scales>
                                                        <backgroundlayers>
                                                            <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" 
                                                                ScaleCenterPos="0.5, 0.695" ScaleID="scale1" ShapeType="CircularHalf_Style25" 
                                                                Size="200, 145" ZOrder="1000" />
                                                        </backgroundlayers>
                                                        <needles>
                                                            <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="13" 
                                                                Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style25" 
                                                                StartOffset="-16.5" ZOrder="-50" />
                                                        </needles>
                                                        <markers>
                                                            <dx:ArcScaleMarkerComponent AcceptOrder="100" ArcScale="" 
                                                                Name="circularGauge10_Marker1" ScaleID="scale1" ZOrder="-100" />
                                                        </markers>
                                                        <spindlecaps>
                                                            <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                                                                Name="circularGauge10_SpindleCap1" ScaleID="scale1" 
                                                                ShapeType="CircularFull_Style25" Size="15, 15" ZOrder="-100" />
                                                        </spindlecaps>
                                                        <labels>
                                                            <dx:LabelComponent AcceptOrder="1001" Name="circularGauge10_Label1" 
                                                                Text="Ток, А" ZOrder="-1001" />
                                                        </labels>
                                                    </dx:CircularGauge>
                                                </Gauges>
                                                <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />

<LayoutPadding All="6" Left="6" Top="6" Right="6" Bottom="6"></LayoutPadding>
                                            </dx:ASPxGaugeControl>
                                            <dx:ASPxGaugeControl ID="ASPxGaugeControl10" runat="server" BackColor="White" 
                                                Height="140px" LayoutInterval="6" Value="0" Width="70px">
                                                <Gauges>
                                                    <dx:LinearGauge Bounds="6, 6, 248, 248" Name="linearGauge9">
                                                        <scales>
                                                            <dx:LinearScaleComponent AcceptOrder="0" 
                                                                AppearanceTickmarkText-Font="Tahoma, 8pt" CustomLogarithmicBase="2" 
                                                                EndPoint="62.5, 38" MajorTickCount="6" MajorTickmark-FormatString="{0:F0}" 
                                                                MajorTickmark-ShapeOffset="-25" MajorTickmark-ShapeType="Linear_Style25_1" 
                                                                MajorTickmark-TextOffset="-35" MaxValue="0" MinorTickCount="4" 
                                                                MinorTickmark-ShapeOffset="-22" MinorTickmark-ShapeType="Linear_Style25_2" 
                                                                Name="scale1" StartPoint="62.5, 212" MinValue="-3000">
                                                                <ranges>
                                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F1D183&quot;/&gt;" 
                                                                        EndThickness="3" EndValue="-1000" Name="Range0" ShapeOffset="-12" 
                                                                        StartThickness="3" />
                                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F1877E&quot;/&gt;" 
                                                                        EndThickness="3" EndValue="-3000" Name="Range1" ShapeOffset="-12" 
                                                                        StartThickness="3" StartValue="-2500" />
                                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#7AC463&quot;/&gt;" 
                                                                        EndThickness="3" EndValue="-2500" Name="Range2" ShapeOffset="-12" 
                                                                        StartThickness="3" StartValue="-1000" />
                                                                </ranges>
                                                            </dx:LinearScaleComponent>
                                                        </scales>
                                                        <levels>
                                                            <dx:LinearScaleLevelComponent AcceptOrder="50" LinearScale="" Name="level1" 
                                                                ScaleID="scale1" ShapeType="Style25" ZOrder="-50" />
                                                        </levels>
                                                        <backgroundlayers>
                                                            <dx:LinearScaleBackgroundLayerComponent AcceptOrder="-1000" LinearScale="" 
                                                                Name="bg1" ScaleID="scale1" ScaleStartPos="0.5, 0.85" 
                                                                ShapeType="Linear_Style25" ZOrder="1000" />
                                                        </backgroundlayers>
                                                        <labels>
                                                            <dx:LabelComponent AcceptOrder="1001" AppearanceText-Font="Tahoma, 12pt" 
                                                                Name="linearGauge9_Label1" Position="93.1, 116.7" Text="Суммарный потенциал, мВ" 
                                                                TextOrientation="BottomToTop" ZOrder="-1001" />
                                                        </labels>
                                                    </dx:LinearGauge>
                                                </Gauges>
                                                <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />

<LayoutPadding All="6" Left="6" Top="6" Right="6" Bottom="6"></LayoutPadding>
                                            </dx:ASPxGaugeControl>
                                            <dx:ASPxGaugeControl ID="ASPxGaugeControl11" runat="server" BackColor="White" 
                                                Height="140px" LayoutInterval="6" Value="0" Width="70px">
                                                <Gauges>
                                                    <dx:LinearGauge Bounds="6, 6, 58, 128" Name="linearGauge9">
                                                        <scales>
                                                            <dx:LinearScaleComponent AcceptOrder="0" 
                                                                AppearanceTickmarkText-Font="Tahoma, 8pt" CustomLogarithmicBase="2" 
                                                                EndPoint="62.5, 38" MajorTickCount="6" MajorTickmark-FormatString="{0:F0}" 
                                                                MajorTickmark-ShapeOffset="-25" MajorTickmark-ShapeType="Linear_Style25_1" 
                                                                MajorTickmark-TextOffset="-35" MaxValue="0" MinorTickCount="4" 
                                                                MinorTickmark-ShapeOffset="-22" MinorTickmark-ShapeType="Linear_Style25_2" 
                                                                MinValue="-3000" Name="scale1" StartPoint="62.5, 212">
                                                                <ranges>
                                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F1D183&quot;/&gt;" 
                                                                        EndThickness="3" EndValue="-850" Name="Range0" ShapeOffset="-12" 
                                                                        StartThickness="3" />
                                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F1877E&quot;/&gt;" 
                                                                        EndThickness="3" EndValue="-3000" Name="Range1" ShapeOffset="-12" 
                                                                        StartThickness="3" StartValue="-1150" />
                                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#7AC463&quot;/&gt;" 
                                                                        EndThickness="3" EndValue="-1150" Name="Range2" ShapeOffset="-12" 
                                                                        StartThickness="3" StartValue="-850" />
                                                                </ranges>
                                                            </dx:LinearScaleComponent>
                                                        </scales>
                                                        <levels>
                                                            <dx:LinearScaleLevelComponent AcceptOrder="50" LinearScale="" Name="level1" 
                                                                ScaleID="scale1" ShapeType="Style25" ZOrder="-50" />
                                                        </levels>
                                                        <backgroundlayers>
                                                            <dx:LinearScaleBackgroundLayerComponent AcceptOrder="-1000" LinearScale="" 
                                                                Name="bg1" ScaleID="scale1" ScaleStartPos="0.5, 0.85" 
                                                                ShapeType="Linear_Style25" ZOrder="1000" />
                                                        </backgroundlayers>
                                                        <labels>
                                                            <dx:LabelComponent AcceptOrder="1001" AppearanceText-Font="Tahoma, 12pt" 
                                                                Name="linearGauge9_Label1" Position="93.1, 116.7" 
                                                                Text="Поляризационный потенциал, мВ" TextOrientation="BottomToTop" 
                                                                ZOrder="-1001" />
                                                        </labels>
                                                    </dx:LinearGauge>
                                                </Gauges>
                                                <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                
<LayoutPadding All="6" Left="6" Top="6" Right="6" Bottom="6"></LayoutPadding>
                                            </dx:ASPxGaugeControl>
                                                <br />
                                            <dx:ASPxGaugeControl ID="ASPxGaugeControl8" runat="server" BackColor="White" 
                                                Height="30px" Value="95" Width="140px">
                                                <Gauges>
                                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                                        Bounds="0, 0, 160, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                                        Text="95">
                                                        <backgroundlayers>
                                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                                ZOrder="1000" />
                                                        </backgroundlayers>
                                                        <labels>
                                                            <dx:LabelComponent AcceptOrder="1001" 
                                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                                        </labels>
                                                    </dx:DigitalGauge>
                                                </Gauges>
                                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                            </dx:ASPxGaugeControl>
                                            <dx:ASPxGaugeControl ID="ASPxGaugeControl9" runat="server" BackColor="White" 
                                                Height="30px" Value="48,800" Width="140px">
                                                <Gauges>
                                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                                        Bounds="0, 0, 160, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                                        Text="48,800">
                                                        <backgroundlayers>
                                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                                ZOrder="1000" />
                                                        </backgroundlayers>
                                                        <labels>
                                                            <dx:LabelComponent AcceptOrder="1001" 
                                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                                        </labels>
                                                    </dx:DigitalGauge>
                                                </Gauges>
                                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                            </dx:ASPxGaugeControl>
                                            <dx:ASPxGaugeControl ID="ASPxGaugeControl12" runat="server" BackColor="White" 
                                                Height="30px" Value="-1200" Width="70px">
                                                <Gauges>
                                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                                        Text="-1200">
                                                        <backgroundlayers>
                                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                                ZOrder="1000" />
                                                        </backgroundlayers>
                                                        <labels>
                                                            <dx:LabelComponent AcceptOrder="1001" 
                                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                                        </labels>
                                                    </dx:DigitalGauge>
                                                </Gauges>
                                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                            </dx:ASPxGaugeControl>
                                            <dx:ASPxGaugeControl ID="ASPxGaugeControl13" runat="server" BackColor="White" 
                                                Height="30px" Value="-900" Width="70px">
                                                <Gauges>
                                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                                        Bounds="0, 0, 70, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                                        Text="-900">
                                                        <backgroundlayers>
                                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                                ZOrder="1000" />
                                                        </backgroundlayers>
                                                        <labels>
                                                            <dx:LabelComponent AcceptOrder="1001" 
                                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                                        </labels>
                                                    </dx:DigitalGauge>
                                                </Gauges>
                                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                            </dx:ASPxGaugeControl>
                                                <br />
                                                Температура, С<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl33" runat="server" 
                                                    BackColor="White" Height="30px" Value="+33,5" Width="140px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                                    <Gauges>
                                                        <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                                            AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                                            Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                                            Text="+33,5">
                                                            <backgroundlayers>
                                                                <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                                    BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                                    ZOrder="1000" />
                                                            </backgroundlayers>
                                                            <labels>
                                                                <dx:LabelComponent AcceptOrder="1001" 
                                                                    AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                                    Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                                            </labels>
                                                        </dx:DigitalGauge>
                                                    </Gauges>
                                                    <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                                                </dx:ASPxGaugeControl>
                                            </td>
                                            </tr>
                                            </table>
                                        </dx:ContentControl>
                        </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 2">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 3">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 4">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 5">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 6">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                            </TabPages>
                        </dx:ASPxPageControl>

                        </td>
                        <td>

                            <b>Последние дата и время</b><br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl4" runat="server" BackColor="White" 
                            Height="20px" Value="50" Width="20px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            <Gauges>
                                <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                    <indicators>
                                        <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                            Name="stateIndicatorComponent1" Size="200, 200" StateIndex="1">
                                            <states>
                                                <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                            </states>
                                        </dx:StateIndicatorComponent>
                                    </indicators>
                                </dx:StateIndicatorGauge>
                            </Gauges>
                            <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                        </dx:ASPxGaugeControl>

                            Двери<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl14" runat="server" 
                                BackColor="White" Height="20px" Value="1" Width="20px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                        <indicators>
                                            <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                                Name="stateIndicatorComponent1" Size="200, 200" StateIndex="1">
                                                <states>
                                                    <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                    <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                    <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                    <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                </states>
                                            </dx:StateIndicatorComponent>
                                        </indicators>
                                    </dx:StateIndicatorGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            Откл. электропитания<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl15" 
                                runat="server" BackColor="White" Height="20px" Value="1" Width="20px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                        <indicators>
                                            <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                                Name="stateIndicatorComponent1" Size="200, 200" StateIndex="1">
                                                <states>
                                                    <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                    <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                    <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                    <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                </states>
                                            </dx:StateIndicatorComponent>
                                        </indicators>
                                    </dx:StateIndicatorGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            Отказ преобразователя<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl16" 
                                runat="server" BackColor="White" Height="20px" Value="1" Width="20px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                        <indicators>
                                            <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                                Name="stateIndicatorComponent1" Size="200, 200" StateIndex="50">
                                                <states>
                                                    <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                    <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                    <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                    <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                </states>
                                            </dx:StateIndicatorComponent>
                                        </indicators>
                                    </dx:StateIndicatorGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            Сбой изм. канала ЭС<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl17" 
                                runat="server" BackColor="White" Height="20px" Value="1" Width="20px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                        <indicators>
                                            <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                                Name="stateIndicatorComponent1" Size="200, 200" StateIndex="1">
                                                <states>
                                                    <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                    <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                    <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                    <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                </states>
                                            </dx:StateIndicatorComponent>
                                        </indicators>
                                    </dx:StateIndicatorGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            Защитный ток около 0<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl18" 
                                runat="server" BackColor="White" Height="20px" Value="1" Width="20px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                        <indicators>
                                            <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                                Name="stateIndicatorComponent1" Size="200, 200" StateIndex="1">
                                                <states>
                                                    <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                    <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                    <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                    <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                </states>
                                            </dx:StateIndicatorComponent>
                                        </indicators>
                                    </dx:StateIndicatorGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            Аккумулятор разряженный<br /> <br />

                            <b>Состояние</b><br /> <br/>
                            <b>Двери</b><br />- 
                            отключение<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl27" runat="server" 
                                BackColor="White" Height="40px" Value="14.03.2017 09:01:56" Width="180px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 180, 40" DigitCount="15" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="14.03.2017 09:01:56">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="739.437561, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            <br />
                            - включение<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl28" runat="server" 
                                BackColor="White" Height="40px" Value="14.03.2017 09:03:39" Width="180px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 180, 40" DigitCount="15" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="14.03.2017 09:03:39">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="739.437561, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            <br /><br/>
                            <b>Электропитание</b><br />- открытие<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl25" 
                                runat="server" BackColor="White" Height="40px" Value="14.03.2017 09:04:51" 
                                Width="180px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 180, 40" DigitCount="15" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="14.03.2017 09:04:51">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="739.437561, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            <br />
                            - закрытие<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl26" runat="server" 
                                BackColor="White" Height="40px" Value="14.03.2017 09:05:25" Width="180px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 180, 40" DigitCount="15" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="14.03.2017 09:05:25">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="739.437561, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            <br /></td>
                        <td>
                            Наличие электропитания<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl32" 
                                runat="server" BackColor="White" Height="30px" Value="220" Width="140px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="220">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            <br />
                            <br />
                            <br />
                            Энергозатраты, кВт/ч<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl19" 
                                runat="server" BackColor="White" Height="30px" Value="0365,5" Width="140px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="0365,5">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            <br />
                            <br />
                            Мощность, кВт<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl21" runat="server" 
                                BackColor="White" Height="30px" Value="0,37" Width="140px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="0,37">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            <br />Загрузка по мощности<br /> <dx:ASPxGaugeControl 
                                ID="ASPxGaugeControl3" runat="server" BackColor="White" Height="50px" Value="1" 
                                Width="140px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:LinearGauge Bounds="0, 0, 140, 50" Name="Level_Bars" 
                                        Orientation="Horizontal">
                                        <scales>
                                            <dx:LinearScaleComponent AcceptOrder="0" 
                                                AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                CustomLogarithmicBase="2" EndPoint="62.5, 225" MajorTickCount="2" 
                                                MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-20" 
                                                MajorTickmark-ShapeType="Linear_Style1_1" MajorTickmark-ShowText="False" 
                                                MajorTickmark-ShowTick="False" MajorTickmark-TextOffset="-32" MaxValue="100" 
                                                MinorTickCount="0" MinorTickmark-ShapeOffset="-14" 
                                                MinorTickmark-ShapeType="Linear_Style1_2" MinorTickmark-ShowTick="False" 
                                                Name="scale1" StartPoint="62.5, 25" Value="1">
                                                <labels>
                                                    <dx:ScaleLabelWeb AppearanceText-Font="Tahoma, 16pt, style=Bold" 
                                                        FormatString="{0} {2:P0}" Name="Label0" Position="62.5, 125" Size="100, 30" 
                                                        Text="" TextOrientation="BottomToTop" />
                                                </labels>
                                            </dx:LinearScaleComponent>
                                        </scales>
                                        <backgroundlayers>
                                            <dx:LinearScaleBackgroundLayerComponent AcceptOrder="-1000" LinearScale="" 
                                                Name="bg1" ScaleEndPos="0.5, 0.1" ScaleID="scale1" ScaleStartPos="0.5, 0.9" 
                                                ShapeType="Linear_Style10" ZOrder="1000" />
                                        </backgroundlayers>
                                        <indicators>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-100" Center="62.5, 225" 
                                                IndicatorScale="" Name="Indicator0" ScaleID="scale1" Size="58.5702, 18.94918" 
                                                StateIndex="0" ZOrder="100">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="100" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="0.01" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="0" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-99" 
                                                Center="62.5, 202.7778" IndicatorScale="" Name="Indicator1" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="99">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="90" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="10" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="10" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-98" 
                                                Center="62.5, 180.5556" IndicatorScale="" Name="Indicator2" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="98">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="80" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="20" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="20" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-97" 
                                                Center="62.5, 158.3333" IndicatorScale="" Name="Indicator3" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="97">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="70" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="30" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="30" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-96" 
                                                Center="62.5, 136.1111" IndicatorScale="" Name="Indicator4" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="96">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="60" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="40" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="40" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-95" 
                                                Center="62.5, 113.8889" IndicatorScale="" Name="Indicator5" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="95">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="50" Name="Colored" 
                                                        ShapeType="Equalizer3" StartValue="50" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="50" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-94" 
                                                Center="62.5, 91.66667" IndicatorScale="" Name="Indicator6" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="94">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="40" Name="Colored" 
                                                        ShapeType="Equalizer3" StartValue="60" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="60" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-93" 
                                                Center="62.5, 69.44444" IndicatorScale="" Name="Indicator7" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="93">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="30" Name="Colored" 
                                                        ShapeType="Equalizer3" StartValue="70" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="70" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-92" 
                                                Center="62.5, 47.22222" IndicatorScale="" Name="Indicator8" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="92">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="20" Name="Colored" 
                                                        ShapeType="Equalizer2" StartValue="80" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="80" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-91" Center="62.5, 25" 
                                                IndicatorScale="" Name="Indicator9" ScaleID="scale1" Size="58.5702, 18.94918" 
                                                StateIndex="1" ZOrder="91">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="10" Name="Colored" 
                                                        ShapeType="Equalizer2" StartValue="90" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="90" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                        </indicators>
                                    </dx:LinearGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            <br />
                            Загрузка по току<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl29" 
                                runat="server" BackColor="White" Height="50px" Value="1" Width="140px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:LinearGauge Bounds="0, 0, 140, 50" Name="Level_Bars" 
                                        Orientation="Horizontal">
                                        <scales>
                                            <dx:LinearScaleComponent AcceptOrder="0" 
                                                AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                CustomLogarithmicBase="2" EndPoint="62.5, 225" MajorTickCount="2" 
                                                MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-20" 
                                                MajorTickmark-ShapeType="Linear_Style1_1" MajorTickmark-ShowText="False" 
                                                MajorTickmark-ShowTick="False" MajorTickmark-TextOffset="-32" MaxValue="100" 
                                                MinorTickCount="0" MinorTickmark-ShapeOffset="-14" 
                                                MinorTickmark-ShapeType="Linear_Style1_2" MinorTickmark-ShowTick="False" 
                                                Name="scale1" StartPoint="62.5, 25" Value="1">
                                                <labels>
                                                    <dx:ScaleLabelWeb AppearanceText-Font="Tahoma, 16pt, style=Bold" 
                                                        FormatString="{0} {2:P0}" Name="Label0" Position="62.5, 125" Size="100, 30" 
                                                        Text="" TextOrientation="BottomToTop" />
                                                </labels>
                                            </dx:LinearScaleComponent>
                                        </scales>
                                        <backgroundlayers>
                                            <dx:LinearScaleBackgroundLayerComponent AcceptOrder="-1000" LinearScale="" 
                                                Name="bg1" ScaleEndPos="0.5, 0.1" ScaleID="scale1" ScaleStartPos="0.5, 0.9" 
                                                ShapeType="Linear_Style10" ZOrder="1000" />
                                        </backgroundlayers>
                                        <indicators>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-100" Center="62.5, 225" 
                                                IndicatorScale="" Name="Indicator0" ScaleID="scale1" Size="58.5702, 18.94918" 
                                                StateIndex="0" ZOrder="100">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="100" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="0.01" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="0" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-99" 
                                                Center="62.5, 202.7778" IndicatorScale="" Name="Indicator1" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="99">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="90" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="10" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="10" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-98" 
                                                Center="62.5, 180.5556" IndicatorScale="" Name="Indicator2" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="98">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="80" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="20" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="20" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-97" 
                                                Center="62.5, 158.3333" IndicatorScale="" Name="Indicator3" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="97">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="70" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="30" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="30" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-96" 
                                                Center="62.5, 136.1111" IndicatorScale="" Name="Indicator4" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="96">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="60" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="40" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="40" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-95" 
                                                Center="62.5, 113.8889" IndicatorScale="" Name="Indicator5" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="95">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="50" Name="Colored" 
                                                        ShapeType="Equalizer3" StartValue="50" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="50" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-94" 
                                                Center="62.5, 91.66667" IndicatorScale="" Name="Indicator6" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="94">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="40" Name="Colored" 
                                                        ShapeType="Equalizer3" StartValue="60" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="60" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-93" 
                                                Center="62.5, 69.44444" IndicatorScale="" Name="Indicator7" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="93">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="30" Name="Colored" 
                                                        ShapeType="Equalizer3" StartValue="70" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="70" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-92" 
                                                Center="62.5, 47.22222" IndicatorScale="" Name="Indicator8" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="92">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="20" Name="Colored" 
                                                        ShapeType="Equalizer2" StartValue="80" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="80" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-91" Center="62.5, 25" 
                                                IndicatorScale="" Name="Indicator9" ScaleID="scale1" Size="58.5702, 18.94918" 
                                                StateIndex="1" ZOrder="91">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="10" Name="Colored" 
                                                        ShapeType="Equalizer2" StartValue="90" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="90" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                        </indicators>
                                    </dx:LinearGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            <br />
                        </td>
                        <td>
                        
                            Входное сопр. трубопровода, Ом<br /> <dx:ASPxGaugeControl 
                                ID="ASPxGaugeControl22" runat="server" BackColor="White" Height="30px" 
                                Value="0,17" Width="140px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="0,17">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            <br />
                            Сопр. цепи СКЗ, Ом<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl23" 
                                runat="server" BackColor="White" Height="30px" Value="6,51" Width="140px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="6,51">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                            <br />
                            Сопр. анодного заземления, Ом<br /> <dx:ASPxGaugeControl ID="ASPxGaugeControl24" 
                                runat="server" BackColor="White" Height="30px" Value="6,33" Width="140px">

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="6,33">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

                            </dx:ASPxGaugeControl>
                        
                        </td>
                        </tr>
                        </table>

                    </dx:ContentControl>
                </contentcollection>
            </dx:TabPage>
            <dx:TabPage Text="Управление">
                <contentcollection>
                    <dx:ContentControl runat="server">
                        
                        <dx:ASPxPageControl ID="ASPxPageControl4" runat="server" ActiveTabIndex="0" 
                            Theme="Youthful">
                            <TabPages>
                                <dx:TabPage Text="Канал 1">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxNavBar ID="ASPxNavBarControl0" runat="server" EnableTheming="True" 
                                                Theme="Youthful" Width="100%">
                                                <Groups>
                                                    <dx:NavBarGroup Name="Суммарный потенциал" Text="Суммарный потенциал">
                                                        <ItemImage IconID="scheduling_cellsautoheight_16x16">
                                                        </ItemImage>
                                                        <ContentTemplate>
                                                            Новое значение суммарного потенциала, мВ<dx:ASPxTrackBar ID="ASPxTrackBar2" 
                                                                runat="server" Direction="Reversed" EnableTheming="True" 
                                                                LargeTickEndValue="-2500" LargeTickInterval="500" MaxValue="0" MinValue="-2500" 
                                                                Position="0" PositionStart="0" ScaleLabelHighlightMode="AlongBarHighlight" 
                                                                ScalePosition="Both" SmallTickFrequency="500" Step="50" Theme="Youthful" 
                                                                Width="300px">
                                                            </dx:ASPxTrackBar>
                                                            <dx:ASPxButton ID="ASPxButton4" runat="server" Text="Выдать">
                                                            </dx:ASPxButton>
                                                            <br />
                                                            <br />
                                                        </ContentTemplate>
                                                    </dx:NavBarGroup>
                                                    <dx:NavBarGroup Expanded="False" Name="Поляризационный потенциал" 
                                                        Text="Поляризационный потенциал">
                                                        <ItemImage IconID="scheduling_cellsautoheight_16x16">
                                                        </ItemImage>
                                                        <ContentTemplate>
                                                            Новое значение поляризационного потенциала, мВ<dx:ASPxTrackBar 
                                                                ID="ASPxTrackBar3" runat="server" Direction="Reversed" EnableTheming="True" 
                                                                LargeTickEndValue="-2500" LargeTickInterval="500" MaxValue="0" MinValue="-2500" 
                                                                Position="0" PositionStart="0" ScaleLabelHighlightMode="AlongBarHighlight" 
                                                                ScalePosition="Both" SmallTickFrequency="500" Step="50" Theme="Youthful" 
                                                                Width="300px">
                                                            </dx:ASPxTrackBar>
                                                            <dx:ASPxButton ID="ASPxButton5" runat="server" Text="Выдать">
                                                            </dx:ASPxButton>
                                                            <br />
                                                            <br />
                                                        </ContentTemplate>
                                                    </dx:NavBarGroup>
                                                    <dx:NavBarGroup Expanded="False" Name="Ток" Text="Ток">
                                                        <ItemImage IconID="chart_rangearea_16x16">
                                                        </ItemImage>
                                                        <ContentTemplate>
                                                            Новое значение тока, А<dx:ASPxTrackBar ID="ASPxTrackBar4" runat="server" 
                                                                EnableTheming="True" LargeTickInterval="10" Position="0" PositionStart="0" 
                                                                ScaleLabelHighlightMode="AlongBarHighlight" ScalePosition="Both" Step="1" 
                                                                Theme="Youthful" Width="300px">
                                                            </dx:ASPxTrackBar>
                                                            <dx:ASPxButton ID="ASPxButton6" runat="server" Text="Выдать">
                                                            </dx:ASPxButton>
                                                            <br />
                                                            <br />
                                                        </ContentTemplate>
                                                    </dx:NavBarGroup>
                                                    <dx:NavBarGroup Expanded="False" Name="Напряжение" Text="Напряжение">
                                                        <ItemImage IconID="chart_stepline_16x16">
                                                        </ItemImage>
                                                        <ContentTemplate>
                                                            Новое значение напряжения, В<dx:ASPxTrackBar ID="ASPxTrackBar5" runat="server" 
                                                                EnableTheming="True" LargeTickInterval="10" Position="0" PositionStart="0" 
                                                                ScaleLabelHighlightMode="AlongBarHighlight" ScalePosition="Both" Step="1" 
                                                                Theme="Youthful" Width="300px">
                                                            </dx:ASPxTrackBar>
                                                            <dx:ASPxButton ID="ASPxButton7" runat="server" Text="Выдать">
                                                            </dx:ASPxButton>
                                                            <br />
                                                            <br />
                                                        </ContentTemplate>
                                                    </dx:NavBarGroup>
                                                    <dx:NavBarGroup Expanded="False" Name="Выключение" Text="Выключение">
                                                        <ItemImage IconID="programming_forcetesting_16x16">
                                                        </ItemImage>
                                                        <ContentTemplate>
                                                            <dx:ASPxButton ID="ASPxButton8" runat="server" Text="Выключить">
                                                            </dx:ASPxButton>
                                                            <br />
                                                        </ContentTemplate>
                                                    </dx:NavBarGroup>
                                                </Groups>
                                            </dx:ASPxNavBar>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 2">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 3">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 4">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 5">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 6">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                            </TabPages>
                        </dx:ASPxPageControl> <br /><br />

                    </dx:ContentControl>
                </contentcollection>
            </dx:TabPage>
            <dx:TabPage Text="Режим прерывания">
                <contentcollection>
                    <dx:ContentControl runat="server">

                        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
                            <Items>
                                <dx:LayoutGroup Caption="ВЫКЛЮЧЕНИЕ" GroupBoxDecoration="HeadingLine">
                                    <Items>
                                        <dx:LayoutItem Caption="Время отключения">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxDateEdit ID="ASPxFormLayout1_E2" runat="server" EditFormat="DateTime" 
                                                        EditFormatString="dd.mm.yyyy hh:mm:ss">
                                                        <TimeSectionProperties Visible="True">
                                                        </TimeSectionProperties>
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Время включения">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxDateEdit ID="ASPxFormLayout1_E3" runat="server" EditFormat="DateTime" 
                                                        EditFormatString="dd.mm.yyyy hh:mm:ss">
                                                        <TimeSectionProperties Visible="True">
                                                        </TimeSectionProperties>
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxButton ID="ASPxFormLayout1_E1" runat="server" Text="Выдать">
                                                    </dx:ASPxButton>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="ПРЕРЫВАНИЕ" GroupBoxDecoration="HeadingLine">
                                    <Items>
                                        <dx:LayoutItem Caption="Время начала">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxDateEdit ID="ASPxFormLayout1_E4" runat="server" EditFormat="DateTime" 
                                                        EditFormatString="dd.mm.yyyy hh:mm:ss">
                                                        <TimeSectionProperties Visible="True">
                                                        </TimeSectionProperties>
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Время окончания">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxDateEdit ID="ASPxFormLayout1_E5" runat="server" EditFormat="DateTime" 
                                                        EditFormatString="dd.mm.yyyy hh:mm:ss">
                                                        <TimeSectionProperties Visible="True">
                                                        </TimeSectionProperties>
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Время во включенном состоянии, с">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxTextBox ID="ASPxFormLayout1_E6" runat="server" Width="170px">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Время в выключенном состоянии, с">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxTextBox ID="ASPxFormLayout1_E7" runat="server" Width="170px">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxButton ID="ASPxFormLayout1_E8" runat="server" Text="Выдать">
                                                    </dx:ASPxButton>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                            </Items>
                        </dx:ASPxFormLayout>

                    </dx:ContentControl>
                </contentcollection>
            </dx:TabPage>
            <dx:TabPage Text="Архив за сутки">
                <contentcollection>
                    <dx:ContentControl runat="server">

                    </dx:ContentControl>
                </contentcollection>
            </dx:TabPage>
        </tabpages>
    </dx:ASPxPageControl>
</asp:Content>
