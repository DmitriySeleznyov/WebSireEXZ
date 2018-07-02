<%@ Page Title="Система дистанционного мониторинга и управления ЭХЗ - Новый объект" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="NewObject.aspx.cs" Inherits="About" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register assembly="DevExpress.Web.v18.1" namespace="DevExpress.Web" tagprefix="dx" %>



<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <script type="text/javascript">
        function OnCheckedChanged(s, e) {
            if (s.GetChecked()) {
                FormLayout1.GetItemByName('LocationLayoutGroup').SetVisible(false);
            }
            else {
                FormLayout1.GetItemByName('LocationLayoutGroup').SetVisible(true);
            }
        }
</script>


    <h2>
       Добавить новый объект
    </h2>


    <br />


<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%" ClientInstanceName="FormLayout1">
                                            <Items>
                                                <dx:LayoutGroup Caption="ОБЪЕКТ" GroupBoxDecoration="HeadingLine">
                                                    <Items>
                                                        <dx:LayoutItem Caption="Название">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server" 
                                                                    SupportsDisabledAttribute="True">                                                            
                                                                    <dx:ASPxTextBox ID="tb_add_subject_name" runat="server" Width="100%">
                                                                        <ValidationSettings>
<RequiredField IsRequired="True" ErrorText="Обязательное поле"></RequiredField>
                                                                        </ValidationSettings>
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
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
                                                                    <dx:ASPxTextBox ID="tb_add_subject_code" runat="server" Width="150px" NullText="">
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
                                                                    <dx:ASPxTextBox ID="tb_subject_add_info" runat="server" Width="150px">
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
<dx:ASPxButton runat="server" Text="Сохранить" CssFilePath="~/Styles/Site.css" 
    CssClass="layoutButton" ID="but_enter" OnClick="but_enter_Click">
</dx:ASPxButton>

                                    
</asp:Content>
