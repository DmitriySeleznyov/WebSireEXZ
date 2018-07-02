﻿<%@ Page Title="Система дистанционного мониторинга и управления ЭХЗ - Управление пользователями" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Users.aspx.cs" Inherits="About" %>

<%@ Register assembly="DevExpress.Web.v18.1" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
       Управление пользователями
    </h2>
    
        
        Количество пользователей online: <asp:Label id="UsersOnlineLabel" runat="Server" /><br />

        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="CustomGetAllUsers"
            TypeName="GetAllUsers"></asp:ObjectDataSource>
            <br />
            <br />
            <asp:GridView ID="UserGrid" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                Width="100%" AllowPaging="True" AllowSorting="True" DataSourceID="ObjectDataSource1">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        
            <h3>
               Создание нового пользователя
            </h3>

        <br/>
        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Регистрация</asp:HyperLink>
        <br/>
            <h3>
        Управление ролями
            </h3>
        <br/>
        <asp:Label ID="Msg" ForeColor="maroon" runat="server" /><br />
    <table cellpadding="3" border="0">
      <tr>
        <td valign="top">
          Ролі:</td>
        <td valign="top">
          <asp:ListBox ID="RolesListBox" runat="server" Rows="8" AutoPostBack="true" /></td>
        <td valign="top">
          Пользователи:</td>
        <td valign="top">
          <asp:ListBox ID="UsersListBox" DataTextField="Username" Rows="8" SelectionMode="Multiple"
            runat="server" /></td>
        <td valign="top">
          <asp:Button Text="Добавить пользователя(ей) к роли" ID="AddUsersButton" runat="server" OnClick="AddUsers_OnClick" /></td>
      </tr>
      <tr>
        <td valign="top">
          Пользователи в роли:</td>
        <td valign="top">
          <asp:GridView runat="server" CellPadding="4" ID="UsersInRoleGrid" AutoGenerateColumns="false"
            GridLines="None" CellSpacing="0" OnRowCommand="UsersInRoleGrid_RemoveFromRole">
            <HeaderStyle BackColor="navy" ForeColor="white" />
            <Columns>
              <asp:TemplateField HeaderText="Пользователь" >
                <ItemTemplate>
                  <%# Container.DataItem.ToString() %>
                </ItemTemplate>
              </asp:TemplateField>
              <asp:ButtonField Text="Удалить из роли" ButtonType="Link" />
            </Columns>
          </asp:GridView>
        </td>
      </tr>
    </table>
</asp:Content>