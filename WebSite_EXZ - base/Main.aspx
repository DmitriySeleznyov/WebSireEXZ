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
    <h2>
       Формирование и просмотр отчетов
    </h2>
    <br /><br /><br /><br />
    <dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server" CssClass="blockpicture" CssFilePath="~/Styles/MainpageCss.css" Height="150px" Width="30%">
    </dx:ASPxBinaryImage>
    <dx:ASPxPageControl ID="ASPxPageControl2" runat="server" ActiveTabIndex="0" CssClass="blocktable" CssFilePath="~/Styles/MainpageCss.css" Theme="Youthful">
        <tabpages>
            <dx:TabPage>
                <contentcollection>
                    <dx:ContentControl runat="server">
                    </dx:ContentControl>
                </contentcollection>
            </dx:TabPage>
            <dx:TabPage>
                <contentcollection>
                    <dx:ContentControl runat="server">
                    </dx:ContentControl>
                </contentcollection>
            </dx:TabPage>
            <dx:TabPage>
                <contentcollection>
                    <dx:ContentControl runat="server">
                    </dx:ContentControl>
                </contentcollection>
            </dx:TabPage>
            <dx:TabPage>
                <contentcollection>
                    <dx:ContentControl runat="server">
                    </dx:ContentControl>
                </contentcollection>
            </dx:TabPage>
        </tabpages>
    </dx:ASPxPageControl>
</asp:Content>
