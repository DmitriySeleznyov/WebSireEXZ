<%@ Page Title="Система дистанционного мониторинга и управления ЭХЗ - Просмотр и редактирование данных" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Subjects.aspx.cs" Inherits="About" UICulture="uk"%>

<%@ Register assembly="DevExpress.Web.v17.2" namespace="DevExpress.Web" tagprefix="dx" %>













<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <script type="text/javascript">

    var lastValidationResult = false;

    function OnCheckedChanged(s, e) 
    {
        // alert(FormLayout1.GetItemByName('LocationLayoutGroup').GetVisible());
        if (s.GetChecked()) 
        {
            FormLayout1.GetItemByName('LocationLayoutGroup').SetVisible(false);
        }
        else 
        {
            FormLayout1.GetItemByName('LocationLayoutGroup').SetVisible(true);
        }
    }

</script>

    <h2>
       Редактирование данных
    </h2>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePageControl">
                                                                        <ProgressTemplate>
                                                                            <div>
                                                                              Выполнение...
                                                                              <img src="Images\ajax-loader.gif" alt=" " style="vertical-align:middle" />
                                                                            </div>
                                                                        </ProgressTemplate>
                                                                     </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePageControl" runat="server" UpdateMode="Conditional" OnUnload="UpdatePageControl_Unload">
                    <ContentTemplate>
                    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" 
                        EnableTabScrolling="True" AutoPostBack="True" Width="100%" >
                        <TabPages >
                            <dx:TabPage Text="Общая информация" ToolTip="Общая информация">
                                <TabImage Height="32px" Url="~/Images/Icons2/01.jpg" Width="32px">
                                </TabImage>
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    <asp:UpdatePanel ID="UpdatePanel_Tab1" runat="server" UpdateMode="Conditional" OnUnload="UpdatePanel_Tab1_Unload">
                                    <ContentTemplate>
                                        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%" ClientInstanceName="FormLayout1">
                                            <Items>
                                                <dx:LayoutGroup Caption="ОБЪЕКТ" GroupBoxDecoration="HeadingLine">
                                                    <Items>
                                                        <dx:LayoutItem Caption="Название">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server" 
                                                                    SupportsDisabledAttribute="True">                                                            
                                                                    <dx:ASPxTextBox ID="tb_subject_name" runat="server" Width="100%">
                                                                        <ValidationSettings>
<RequiredField IsRequired="True" ErrorText="Обязательное поле"></RequiredField>
                                                                        </ValidationSettings>
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>                                                        
                                                        <dx:LayoutItem Caption="ID">
                                                            <layoutitemnestedcontrolcollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                                    SupportsDisabledAttribute="True">
                                                                    <dx:ASPxTextBox ID="tb_subject_id" runat="server" ReadOnly="True" Width="170px">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </layoutitemnestedcontrolcollection>
                                                        </dx:LayoutItem>
                                                    </Items>
                                                </dx:LayoutGroup>
                                                <dx:LayoutGroup Caption="ОБЩАЯ ИНФОРМАЦИЯ" GroupBoxDecoration="HeadingLine" 
                                                    ColCount="1">
                                                    <Items>
                                                        <dx:LayoutItem Caption="Тип устройства" >
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                                                    <dx:ASPxComboBox ID="combox_subject_type" runat="server">
                                                                        <Items>
                                                                            <dx:ListEditItem Text="СДЗ" Value="СДЗ" />
                                                                            <dx:ListEditItem Text="БКМУ" Value="БКМУ" />
                                                                            <dx:ListEditItem Text="БСЗ" Value="БСЗ" />
                                                                            <dx:ListEditItem Text="БКМУ+БСЗ" Value="БКМУ+БСЗ" />
                                                                            <dx:ListEditItem Text="МТДУ" Value="МТДУ" />
                                                                            <dx:ListEditItem Text="СКЗ" Value="СКЗ" />
                                                                        </Items>
                                                                        <ValidationSettings>
<RequiredField IsRequired="True" ErrorText="Обязательное поле"></RequiredField>
                                                                        </ValidationSettings>
                                                                    </dx:ASPxComboBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="Код устройства">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server" 
                                                                    SupportsDisabledAttribute="True">
                                                                    <dx:ASPxTextBox ID="tb_subject_code" runat="server" Width="150px" NullText="">
                                                                        <ValidationSettings>
<RequiredField IsRequired="True" ErrorText="Обязательное поле"></RequiredField>
                                                                        </ValidationSettings>
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>                                                        
                                                        <dx:LayoutItem Caption="Описание">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                                    SupportsDisabledAttribute="True">                                                                   
                                                                    <dx:ASPxTextBox ID="tb_subject_add_info" runat="server" Width="100%">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                    </Items>
                                                </dx:LayoutGroup>
                                                 
                                                <dx:LayoutGroup Caption="МЕСТОРАСПОЛОЖЕНИЕ" ColCount="2" 
                                                    GroupBoxDecoration="HeadingLine">
                                                    <Items>
                                                        <dx:LayoutItem Caption="Километр">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                                    SupportsDisabledAttribute="True">
                                                                        <dx:ASPxTextBox ID="tb_subject_loc" runat="server" Width="170px">
                                                                        </dx:ASPxTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="Объект">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                                    SupportsDisabledAttribute="True">                                                                    
                                                                    <dx:ASPxTextBox ID="tb_object_name" runat="server" Font-Bold="False" 
                                                                        Width="150px">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="Широта">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                                    SupportsDisabledAttribute="True">                                                                 
                                                                    <dx:ASPxTextBox ID="tb_subject_lat" runat="server" Width="100%">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="Долгота">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                                    SupportsDisabledAttribute="True">                                                                   
                                                                    <dx:ASPxTextBox ID="tb_subject_lon" runat="server" Width="150px">
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
                                        <asp:UpdateProgress ID="UpdateProgress_Tab1" runat="server" AssociatedUpdatePanelID="UpdatePanel_Tab1">
                <ProgressTemplate>
                    <div>
                        Виконання...
                        <img src="Images\ajax-loader.gif" alt=" " style="vertical-align:middle" />
                    </div>
                </ProgressTemplate>
                </asp:UpdateProgress>
                                        <dx:ASPxButton ID="but_enter" runat="server"   
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
                    

    <h2>
       ТРУБОПРОВОДЫ
    </h2>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" OnUnload="UpdatePanel2_Unload">
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
