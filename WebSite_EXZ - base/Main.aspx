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
    <dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server" CssClass="blockpicture" CssFilePath="~/Styles/MainpageCss.css" Height="500px" Width="34%" AlternateText="Для данного устройства нет изображения!" >
    </dx:ASPxBinaryImage>
    <dx:ASPxPageControl ID="ASPxPageControl2" runat="server" ActiveTabIndex="0" CssClass="blocktable" CssFilePath="~/Styles/MainpageCss.css" Theme="Youthful" Height="500px">
        <tabpages>
            <dx:TabPage Text="Мониторинг">
                <contentcollection>
                    <dx:ContentControl runat="server">
                    </dx:ContentControl>
                </contentcollection>
            </dx:TabPage>
            <dx:TabPage Text="Управление">
                <contentcollection>
                    <dx:ContentControl runat="server">
                    </dx:ContentControl>
                </contentcollection>
            </dx:TabPage>
            <dx:TabPage Text="Режим прерывания">
                <contentcollection>
                    <dx:ContentControl runat="server">
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
