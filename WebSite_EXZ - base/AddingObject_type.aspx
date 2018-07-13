<%@ Page Title="Система дистанционного мониторинга и управления ЭХЗ -Добавление типа объекта" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="AddingObject_type.aspx.cs" Inherits="AddingObject_type" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<%@ Register Assembly="DevExpress.Web.v18.1" namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxTreeList.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTreeList" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.Bootstrap.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="ID">
    </dx:ASPxLabel>
    <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="170px">
    </dx:ASPxTextBox>
    <dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="Название">
    </dx:ASPxLabel>
    <br />
    <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="170px">
    </dx:ASPxTextBox>
    <dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="Код">
    </dx:ASPxLabel>
    <br />
    <dx:ASPxTextBox ID="ASPxTextBox3" runat="server" Width="170px">
    </dx:ASPxTextBox>
    <br />
    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Добавить" OnClick="ASPxButton1_Click">
    </dx:ASPxButton>
    <br />
</asp:Content>