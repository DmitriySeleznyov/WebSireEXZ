<%@ Page Title="gplw cbcntyvf" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="try.aspx.cs" Inherits="About" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register assembly="DevExpress.Web.v18.1" namespace="DevExpress.Web" tagprefix="dx" %>






<%@ Register assembly="DevExpress.XtraCharts.v18.1.Web" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.1" namespace="DevExpress.XtraCharts" tagprefix="cc2" %>




<%@ Register assembly="DevExpress.Xpo.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Xpo" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>




<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Table ID="Table1" runat="server" Height="122px" Width="221px">
    </asp:Table>
    <br />
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Button" />
    <br />
    <br />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="XmlDataSource1">
    </asp:DropDownList>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/markers_bkmu.xml"></asp:XmlDataSource>
    <br />
    <asp:Panel ID="Panel1" runat="server">
        <br />
        <br />
        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="4" ColumnCount="4" DataSourceID="XmlDataSource2" EnableTheming="True" Theme="MaterialCompact">
        </dx:ASPxFormLayout>
        <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/subject_detail.xml"></asp:XmlDataSource>
        <br />
    </asp:Panel>
</asp:Content>