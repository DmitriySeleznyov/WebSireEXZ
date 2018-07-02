﻿<%@ Page Title="Система дистанционного мониторинга и управления ЭХЗ" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Start.aspx.cs" Inherits="About" %>

<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.1"
    Namespace="DevExpress.Web.ASPxGauges" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Dashboard.v18.1.Web.WebForms"
    Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" tagprefix="dx" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Приветствуем в системе дистанционного мониторинга и управления ЭХЗ!
    </h2>
    <p>
 <b><h3>Мониторинг ЭХЗ</b>
 </h3>
        <table style="width: 100%;" cellpadding = "10">
            <tr>
                <td width = "60%" valign = "top">
 <h3>
<b><font color="navy"> НОВОСТИ</font></b>
 </h3>
              </br>
        <table style="width: 100%;" cellpadding = "10">
            <tr>
                <td width = "100%" valign = "top">
              <b><font color="navy"> 00.00.2017</font></b>
              </br>
              <b><font color="red" > ВНИМАНИЕ!</b>
              <br />
              .
              </font>
              <p>
              </p>
              .
              </br>
              </td>
            </tr>
            <tr>
                <td width = "100%" valign = "top">
              <b><font color="navy"> 00.00.2017</font></b>
              </br>
                <b>.</b>
                
              </br>
              </td>
            </tr>

            </table>
                </td>
                <td width = "40%"  valign = "top">
 <h3>
<b><font color="red"> По всем вопросам связанных с работой системы обращайтесь по телефону технической поддержки:</font></b></br> <b><font color="blue"> 000 00-00-000 </font></b>
 </h3>

 <h3>
 </h3>
 <h3>
Устройства в системе ЭХЗ:
 </h3>

<ul>
<li> Блоки коррозионного мониторинга и управления (БКМУ) применяются в
системах электрохимической защиты трубопроводов от коррозии и
предназначены для измерения поляризационного и суммарного защитных
потенциалов и передачи данных параметров по системе телеметрии</li>
<li> Блок совместной защиты предназначен для совместной защиты нескольких объектов от одной станции
катодной защиты, устранения вредного взаимного влияния соседних
трубопроводов и автоматического поддержания установленного защитного
потенциала на защищаемых объектах</li>
<li> МТДУ предназначен для дистанционного съема информации со станции катодной
защиты и передаче основных рабочих параметров СКЗ</li>
</ul>    
    </p>
                </td>
            </tr>
        </table>
    <p>
    </p>

    
</asp:Content>