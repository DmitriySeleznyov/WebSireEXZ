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
    <div id ="treeView" width ="25%">
    <dx:ASPxTreeView ID="ASPxTreeView1" runat="server">
    </dx:ASPxTreeView>
    </div>

    <br />
     <h2>
       ТРУБОПРОВОДЫ
    </h2>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" OnUnload="UpdatePanel2_Unload" width ="70%">
                    <ContentTemplate>
                    <dx:ASPxPageControl ID="ASPxPageControl2" runat="server" ActiveTabIndex="0" 
                        EnableTabScrolling="True" AutoPostBack="True" Width="100%" >
                        <TabPages >
                            <dx:TabPage Text="Общая информация" ToolTip="Общая информация">
                                <TabImage Height="32px" Url="~/Images/Icons2/01.jpg" Width="32px">
                                </TabImage>
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    <asp:UpdatePanel ID="UpdatePanel_Tab2" runat="server" UpdateMode="Conditional" OnUnload="UpdatePanel_Tab2_Unload">
                                    <ContentTemplate>
                                        <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" Width="100%" ClientInstanceName="FormLayout2">
                                            <Items>
                                                <dx:LayoutGroup Caption="ТРУБОПРОВОД" GroupBoxDecoration="HeadingLine">
                                                    <Items>
                                                        <dx:LayoutItem Caption="Название">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer11" runat="server" 
                                                                    SupportsDisabledAttribute="True">                                                            
                                                                    <dx:ASPxTextBox ID="tb_subject_name2" runat="server" Width="100%">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>                                                        
                                                    </Items>
                                                </dx:LayoutGroup>
                                                <dx:LayoutGroup Caption="ОБЩАЯ ИНФОРМАЦИЯ" GroupBoxDecoration="HeadingLine" 
                                                    ColCount="1">
                                                    <Items>
                                                        <dx:LayoutItem Caption="Тип трубопровода" >
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer13" runat="server">
                                                                    <dx:ASPxComboBox ID="combox_subject_type1" runat="server">
                                                                        <Items>
                                                                            <dx:ListEditItem Text="нитка" Value="нитка" />
                                                                            <dx:ListEditItem Text="отвод" Value="отвод" />
                                                                            <dx:ListEditItem Text="луппинг" Value="луппинг" />
                                                                        </Items>
                                                                    </dx:ASPxComboBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="Описание">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                                    SupportsDisabledAttribute="True">                                                                   
                                                                    <dx:ASPxTextBox ID="tb_subject_add_info1" runat="server" Width="100%">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                    </Items>
                                                </dx:LayoutGroup>
                                                 
                                                <dx:LayoutGroup Caption="МЕСТОРАСПОЛОЖЕНИЕ" ColCount="2" 
                                                    GroupBoxDecoration="HeadingLine">
                                                    <Items>
                                                        <dx:LayoutItem Caption="Начало, км">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                                    SupportsDisabledAttribute="True">
                                                                        <dx:ASPxTextBox ID="tb_subject_loc1" runat="server" Width="170px">
                                                                        </dx:ASPxTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="+ смещение">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                                    SupportsDisabledAttribute="True">                                                                    
                                                                    <dx:ASPxTextBox ID="tb_object_name1" runat="server" Font-Bold="False" 
                                                                        Width="150px">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="Длина, км">
                                                            <layoutitemnestedcontrolcollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                                    SupportsDisabledAttribute="True">
                                                                    <dx:ASPxTextBox ID="ASPxFormLayout2_E1" runat="server" Width="170px">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </layoutitemnestedcontrolcollection>
                                                        </dx:LayoutItem>
                                                        <dx:EmptyLayoutItem>
                                                        </dx:EmptyLayoutItem>
                                                        <dx:LayoutItem Caption="Широта">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                                    SupportsDisabledAttribute="True">                                                                 
                                                                    <dx:ASPxTextBox ID="tb_subject_lat1" runat="server" Width="100%">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="Долгота">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                                    SupportsDisabledAttribute="True">                                                                   
                                                                    <dx:ASPxTextBox ID="tb_subject_lon1" runat="server" Width="150px">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                    </Items>
                                                </dx:LayoutGroup>
                                            </Items>
                                            <Styles>
                                                <LayoutItem CssClass="lab">
                                                </LayoutItem>
                                                <LayoutGroupBox>
                                                    <Border BorderColor="#BEDF39" />
                                                    <Border BorderColor="#BEDF39"></Border>
                                                </LayoutGroupBox>
                                            </Styles>
                                        </dx:ASPxFormLayout>
                                        <br />
                                        <br />
                                        <asp:UpdateProgress ID="UpdateProgress_Tab2" runat="server" AssociatedUpdatePanelID="UpdatePanel_Tab2">
                <ProgressTemplate>
                    <div>
                        Виконання...
                        <img src="Images\ajax-loader.gif" alt=" " style="vertical-align:middle" />
                    </div>
                </ProgressTemplate>
                </asp:UpdateProgress>
                                        <dx:ASPxButton ID="but_enter2" runat="server"   
                                            OnClick="but_enter_Click" Text="Сохранить" CssClass="layoutButton" 
                                            CssFilePath="~/Styles/Site.css">
                                        </dx:ASPxButton>
                
                <br />
                 <br />
                </ContentTemplate>
                <Triggers>
                 </Triggers>
                </asp:UpdatePanel>
                
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Крановые узлы">
                                <tabimage url="~/Images/Icons2/t1.png">
                                </tabimage>
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Наземные объекты">
                                <tabimage url="~/Images/Icons2/t2.png">
                                </tabimage>
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Переходы">
                                <tabimage url="~/Images/Icons2/t3.png">
                                </tabimage>
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Состояние изоляции">
                                <tabimage url="~/Images/Icons2/t4.png">
                                </tabimage>
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Прочность стали">
                                <tabimage url="~/Images/Icons2/t5.png">
                                </tabimage>
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Диаметр трубы">
                                <tabimage url="~/Images/Icons2/t6.png">
                                </tabimage>
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Толщина стенок">
                                <tabimage url="~/Images/Icons2/t7.png">
                                </tabimage>
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Параметры грунта">
                                <tabimage url="~/Images/Icons2/t8.png">
                                </tabimage>
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Степень коррозии">
                                <tabimage url="~/Images/Icons2/t9.png">
                                </tabimage>
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Блуждающие токи">
                                <tabimage url="~/Images/Icons2/t10.png">
                                </tabimage>
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Кислотность грунта" Visible="False">
                                <tabimage url="~/Images/Icons2/t11.png">
                                </tabimage>
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Эл. сопр. грунта" Visible="False">
                                <tabimage url="~/Images/Icons2/t12.png">
                                </tabimage>
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Уровень грунтовых вод" Visible="False">
                                <tabimage url="~/Images/Icons2/t13.png">
                                </tabimage>
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Температура продукта" Visible="False">
                                <tabimage url="~/Images/Icons2/t14.png">
                                </tabimage>
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Уровень давления" Visible="False">
                                <tabimage url="~/Images/Icons2/t15.png">
                                </tabimage>
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Проведение ТО" Visible="False">
                                <tabimage url="~/Images/Icons2/t16.png">
                                </tabimage>
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>


                        </TabPages>
                        <ActiveTabStyle BackColor="#BEDF39">
                        </ActiveTabStyle>
                        <TabStyle HorizontalAlign="Left" BackColor="White">
                            <Paddings PaddingLeft="5px"></Paddings>
                        </TabStyle>
                        <ScrollButtonStyle BackColor="#BEDF39">
                        </ScrollButtonStyle>
                    </dx:ASPxPageControl>
                </ContentTemplate>
             </asp:UpdatePanel>
</asp:Content>