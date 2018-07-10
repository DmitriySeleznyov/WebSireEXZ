<%@ Page Title="Система дистанционного мониторинга и управления ЭХЗ -Работа с объектом" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="WorkWithSubject.aspx.cs" Inherits="WorkWithSubject" %>
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
    <br /><br />  

                        


    <br />





    <dx:ASPxTreeView ID="ASPxTreeView1" runat="server" OnNodeClick="ASPxTreeView1_NodeClick">
        <Nodes>
            <dx:TreeViewNode>
            </dx:TreeViewNode>
        </Nodes>
    </dx:ASPxTreeView>





    <br />
    <br />
    <br />
</asp:Content>