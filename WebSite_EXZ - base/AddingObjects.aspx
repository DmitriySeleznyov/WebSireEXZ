<%@ Page Title="Система дистанционного мониторинга и управления ЭХЗ -Добавление объекта" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="AddingObjects.aspx.cs" Inherits="AddingObjects" %>
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
    <dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="Название обьекта">
    </dx:ASPxLabel>
    <br />
    <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="170px">
    </dx:ASPxTextBox>
    <dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="ID обьекта">
    </dx:ASPxLabel>
    <br />
    <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="170px">
    </dx:ASPxTextBox>
    <dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="Тип объекта">
    </dx:ASPxLabel>
    <br />
    <dx:ASPxTextBox ID="ASPxTextBox3" runat="server" Width="170px">
    </dx:ASPxTextBox>
    <dx:ASPxLabel ID="ASPxLabel23" runat="server" Text="Короткое имя объекта">
    </dx:ASPxLabel>
    <br />
    <dx:ASPxTextBox ID="ASPxTextBox4" runat="server" Width="170px">
    </dx:ASPxTextBox>
    <dx:ASPxLabel ID="ASPxLabel24" runat="server" Text="Дополнительная информация">
    </dx:ASPxLabel>
    <br />
    <dx:ASPxTextBox ID="ASPxTextBox5" runat="server" Width="170px">
    </dx:ASPxTextBox>
    <dx:ASPxLabel ID="ASPxLabel25" runat="server" Text="loc">
    </dx:ASPxLabel>
    <br />
    <dx:ASPxTextBox ID="ASPxTextBox6" runat="server" Width="170px">
    </dx:ASPxTextBox>
    <dx:ASPxLabel ID="ASPxLabel26" runat="server" Text="latitude">
    </dx:ASPxLabel>
    <br />
    <dx:ASPxTextBox ID="ASPxTextBox7" runat="server" Width="170px">
    </dx:ASPxTextBox>
    <dx:ASPxLabel ID="ASPxLabel27" runat="server" Text="lonitude">
    </dx:ASPxLabel>
    <br />
    <dx:ASPxTextBox ID="ASPxTextBox8" runat="server" Width="170px">
    </dx:ASPxTextBox>
    <dx:ASPxLabel ID="ASPxLabel28" runat="server" Text="ASPxLabel">
    </dx:ASPxLabel>
    <br />
    <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" RightToLeft="False" UploadMode="Auto" UploadStorage="FileSystem" Width="280px">
        <browsebutton text="Загрузить">
        </browsebutton>
    </dx:ASPxUploadControl>
    <br />

    <dx:ASPxButton ID="ASPxButton2" runat="server" OnClick="ASPxButton2_Click" Text="добавить">
    </dx:ASPxButton>

    <br />
    </asp:Content>