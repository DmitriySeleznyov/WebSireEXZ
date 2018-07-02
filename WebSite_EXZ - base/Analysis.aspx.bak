<%@ Page Title="Система дистанционного мониторинга и управления ЭХЗ - Анализ" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Analysis.aspx.cs" Inherits="About" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register assembly="DevExpress.Web.v17.2" namespace="DevExpress.Web" tagprefix="dx" %>






<%@ Register assembly="DevExpress.XtraCharts.v17.2.Web" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v17.2" namespace="DevExpress.XtraCharts" tagprefix="cc2" %>




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
       Анализ данных мониторинга
    </h2>


    <br />


    <dx:ASPxNavBar ID="ASPxNavBar1" runat="server" EnableTheming="True" 
        Theme="Youthful" Width="100%">
        <Groups>
            <dx:NavBarGroup Text="Фильтры">
                <ContentTemplate>
                    Период<br /><br /><dx:ASPxLabel ID="from" runat="server" 
                        ClientInstanceName="from" ClientVisible="true" Text="от:" Width="50px">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="tb_from" runat="server" ClientInstanceName="tb_from" 
                        ClientVisible="true" Width="100px">
                        <validationsettings>
                            <RegularExpression ErrorText="Формат ДД.ММ.РРРР" ValidationExpression="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}"/>
                        </validationsettings>
                    </dx:ASPxTextBox>
                    <dx:ASPxLabel ID="to" runat="server" ClientInstanceName="to" 
                        ClientVisible="true" Text="до:" Width="50px">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="tb_to" runat="server" ClientInstanceName="tb_to" 
                        ClientVisible="true" Width="100px">
                        <validationsettings>
                            <RegularExpression ErrorText="Формат ДД.ММ.РРРР" ValidationExpression="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}"/>
                        </validationsettings>
                    </dx:ASPxTextBox>
                                    <br />
                                    <dx:ASPxButton ID="apply_filter" runat="server" Text="Применить фильтры" 
                                        CssClass="layoutButton" CssFilePath="~/Styles/Site.css" onclick="apply_filter_Click">
                                    </dx:ASPxButton>
                                    <dx:ASPxButton ID="clear_filter" runat="server" Text="Отменить фильтры" 
                                        CssClass="layoutButton" CssFilePath="~/Styles/Site.css" onclick="clear_filter_Click">
                                    </dx:ASPxButton>
                                    <br />                            
                </ContentTemplate>
            </dx:NavBarGroup>
            <dx:NavBarGroup Name="СКЗ" Text="СКЗ" Expanded="False">
                <ContentTemplate>
                    <dx:ASPxGridView ID="ASPxGridView12" runat="server" AutoGenerateColumns="False" 
                        CssClass="style=&quot;text-align:center&quot;" DataSourceID="SqlDataSource32" 
                        EnableTheming="True" Theme="Youthful">
                        <Columns>
                            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="Название" FieldName="subject" 
                                VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Сум. пот." FieldName="sum" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Пол. пот." FieldName="pol" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Ток" FieldName="curr" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Напряжение" FieldName="volt" 
                                VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Температура" FieldName="temper" 
                                VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Состояние" FieldName="state" 
                                VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Время" FieldName="time" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                        <settings showfilterrow="True" showgrouppanel="True" />
                        <settings showfilterrow="True" showgrouppanel="True" />
                    </dx:ASPxGridView>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource32" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PostgresConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:PostgresConnectionString.ProviderName %>" 
                        SelectCommand="select s.subject_name as subject, m.sum_pot as sum, m.pol_pot as pol, m.curr as curr, m.volt as volt, m.temper as temper, m.state as state, m.reg_time as time from &quot;Monitoring_SKZ&quot; as m LEFT JOIN &quot;Subject&quot; as s on m.subject_id=s.subject_id">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PostgresConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:PostgresConnectionString.ProviderName %>" 
                        SelectCommand="select s.subject_name as subject, MAX(m.sum_pot) as sump, m.reg_time as time from &quot;Monitoring_SKZ&quot; as m LEFT JOIN &quot;Subject&quot; as s on m.subject_id=s.subject_id GROUP BY subject,time">
                    </asp:SqlDataSource>
                    <br />
                    <dxchartsui:WebChartControl ID="WebChartControl10" runat="server" 
                        CrosshairEnabled="True" CssClass="style=&quot;text-align:center&quot;" 
                        DataSourceID="SqlDataSource4" Height="400px" SeriesDataMember="subject" 
                        Width="800px">
                        <diagramserializable>
                            <cc2:XYDiagram>
                                <axisx title-text="Время" title-visible="True" visibleinpanesserializable="-1">
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><datetimescaleoptions aggregatefunction="None" autogrid="True" 
                                        measureunit="Hour">
                                    </datetimescaleoptions>
                                </axisx>
                                <axisy title-text="Потенциал, В" title-visible="True" 
                                    visibleinpanesserializable="-1">
                                </axisy>
                            </cc2:XYDiagram>
                        </diagramserializable>
                        <legend alignmentvertical="Center" UseCheckBoxes="True"></legend>
                        <seriestemplate argumentdatamember="time" argumentscaletype="DateTime" 
                            labelsvisibility="True" synchronizepointoptions="False" 
                            valuedatamembersserializable="sump">
                            <viewserializable>
                                <cc2:LineSeriesView>
                                </cc2:LineSeriesView>
                            </viewserializable>
                            <legendpointoptionsserializable>
                                <cc2:PointOptions PointView="ArgumentAndValues">
                                </cc2:PointOptions>
                            </legendpointoptionsserializable>
                        </seriestemplate>
                        <titles>
                            <cc2:ChartTitle Text="Суммарный потенциал" />
                        </titles>
                    </dxchartsui:WebChartControl>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PostgresConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:PostgresConnectionString.ProviderName %>" 
                        SelectCommand="select s.subject_name as subject, MAX(m.pol_pot) as sump, m.reg_time as time from &quot;Monitoring_SKZ&quot; as m LEFT JOIN &quot;Subject&quot; as s on m.subject_id=s.subject_id GROUP BY subject,time">
                    </asp:SqlDataSource>
                    <br />
                    <dxchartsui:WebChartControl ID="WebChartControl11" runat="server" 
                        CrosshairEnabled="True" CssClass="style=&quot;text-align:center&quot;" 
                        DataSourceID="SqlDataSource5" Height="400px" SeriesDataMember="subject" 
                        Width="800px">
                        <diagramserializable>
                            <cc2:XYDiagram>
                                <axisx title-text="Время" title-visible="True" visibleinpanesserializable="-1">
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><datetimescaleoptions aggregatefunction="None" autogrid="True" 
                                        measureunit="Hour">
                                    </datetimescaleoptions>
                                </axisx>
                                <axisy title-text="Потенциал, В" title-visible="True" 
                                    visibleinpanesserializable="-1">
                                </axisy>
                            </cc2:XYDiagram>
                        </diagramserializable>
                        <legend alignmentvertical="Center" UseCheckBoxes="True"></legend>
                        <seriestemplate argumentdatamember="time" labelsvisibility="True" 
                            synchronizepointoptions="False" valuedatamembersserializable="sump">
                            <viewserializable>
                                <cc2:LineSeriesView>
                                </cc2:LineSeriesView>
                            </viewserializable>
                            <legendpointoptionsserializable>
                                <cc2:PointOptions PointView="ArgumentAndValues">
                                </cc2:PointOptions>
                            </legendpointoptionsserializable>
                        </seriestemplate>
                        <titles>
                            <cc2:ChartTitle Text="Поляризационный потенциал" />
                        </titles>
                    </dxchartsui:WebChartControl>
                    <br />
                    <dx:ASPxPageControl ID="ASPxPageControl22" runat="server" ActiveTabIndex="0" 
                        Theme="Youthful">
                        <tabpages>
                            <dx:TabPage Text="Ток">
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:PostgresConnectionString %>" 
                                            ProviderName="<%$ ConnectionStrings:PostgresConnectionString.ProviderName %>" 
                                            SelectCommand="select s.subject_name as subject, MAX(m.curr) as sump, m.reg_time as time from &quot;Monitoring_SKZ&quot; as m LEFT JOIN &quot;Subject&quot; as s on m.subject_id=s.subject_id GROUP BY subject,time">
                                        </asp:SqlDataSource>
                                        <dxchartsui:WebChartControl ID="WebChartControl12" runat="server" 
                                            CrosshairEnabled="True" CssClass="style=&quot;text-align:center&quot;" 
                                            DataSourceID="SqlDataSource6" Height="400px" SeriesDataMember="subject" 
                                            Width="800px">
                                            <diagramserializable>
                                                <cc2:XYDiagram>
                                                    <axisx title-text="Время" title-visible="True" visibleinpanesserializable="-1">
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><datetimescaleoptions aggregatefunction="None" autogrid="True" 
                                                            measureunit="Hour">
                                                        </datetimescaleoptions>
                                                    </axisx>
                                                    <axisy title-text="Ток, А" title-visible="True" visibleinpanesserializable="-1">
                                                    </axisy>
                                                </cc2:XYDiagram>
                                            </diagramserializable>
                                            <legend alignmentvertical="Center" usecheckboxes="True"></legend>
                                            <seriestemplate argumentdatamember="time" labelsvisibility="True" 
                                                synchronizepointoptions="False" valuedatamembersserializable="sump">
                                                <viewserializable>
                                                    <cc2:LineSeriesView>
                                                    </cc2:LineSeriesView>
                                                </viewserializable>
                                                <legendpointoptionsserializable>
                                                    <cc2:PointOptions PointView="ArgumentAndValues">
                                                    </cc2:PointOptions>
                                                </legendpointoptionsserializable>
                                            </seriestemplate>
                                            <titles>
                                                <cc2:ChartTitle Text="Ток" />
                                            </titles>
                                        </dxchartsui:WebChartControl>
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Напряжение">
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:PostgresConnectionString %>" 
                                            ProviderName="<%$ ConnectionStrings:PostgresConnectionString.ProviderName %>" 
                                            SelectCommand="select s.subject_name as subject, MAX(m.volt) as sump, m.reg_time as time from &quot;Monitoring_SKZ&quot; as m LEFT JOIN &quot;Subject&quot; as s on m.subject_id=s.subject_id GROUP BY subject,time">
                                        </asp:SqlDataSource>
                                        <dxchartsui:WebChartControl ID="WebChartControl13" runat="server" 
                                            CrosshairEnabled="True" CssClass="style=&quot;text-align:center&quot;" 
                                            DataSourceID="SqlDataSource7" Height="400px" SeriesDataMember="subject" 
                                            Width="800px">
                                            <diagramserializable>
                                                <cc2:XYDiagram>
                                                    <axisx title-text="Время" title-visible="True" visibleinpanesserializable="-1">
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><datetimescaleoptions aggregatefunction="None" autogrid="True" 
                                                            measureunit="Hour">
                                                        </datetimescaleoptions>
                                                    </axisx>
                                                    <axisy title-text="Напряжение, В" title-visible="True" 
                                                        visibleinpanesserializable="-1">
                                                    </axisy>
                                                </cc2:XYDiagram>
                                            </diagramserializable>
                                            <legend alignmentvertical="Center" usecheckboxes="True"></legend>
                                            <seriestemplate argumentdatamember="time" labelsvisibility="True" 
                                                synchronizepointoptions="False" valuedatamembersserializable="sump">
                                                <viewserializable>
                                                    <cc2:LineSeriesView>
                                                    </cc2:LineSeriesView>
                                                </viewserializable>
                                                <legendpointoptionsserializable>
                                                    <cc2:PointOptions PointView="ArgumentAndValues">
                                                    </cc2:PointOptions>
                                                </legendpointoptionsserializable>
                                            </seriestemplate>
                                            <titles>
                                                <cc2:ChartTitle Text="Напряжение" />
                                            </titles>
                                        </dxchartsui:WebChartControl>
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                        </tabpages>
                    </dx:ASPxPageControl>
                    <br />
                </ContentTemplate>
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="СДЗ" Name="СДЗ" Expanded="False">
                <ContentTemplate>
                    <dx:ASPxGridView ID="ASPxGridView13" runat="server" AutoGenerateColumns="False" 
                        CssClass="style=&quot;text-align:center&quot;" DataSourceID="SqlDataSource34" 
                        EnableTheming="True" Theme="Youthful">
                        <Columns>
                            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="Название" FieldName="subject" 
                                VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Пот. &quot;т-з&quot;" FieldName="sum" 
                                VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Пот. &quot;р-з&quot;" FieldName="pol" 
                                VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Ток" FieldName="curr" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Напр. АКБ" FieldName="volt" 
                                VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Состояние двери" FieldName="state" 
                                VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Время" FieldName="time" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                        <settings showfilterrow="True" showgrouppanel="True" />
                        <settings showfilterrow="True" showgrouppanel="True" />
                        <settings showfilterrow="True" showgrouppanel="True" />
                    </dx:ASPxGridView>
                    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" EnableTheming="True" 
                        Theme="Default" Width="100%">
                        <Items>
                            <dx:LayoutItem Caption="СДЗ">
                                <layoutitemnestedcontrolcollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" 
                                        SupportsDisabledAttribute="True">
                                        <dx:ASPxComboBox ID="ASPxFormLayout1_E8" runat="server" 
                                            DataSourceID="SqlDataSource8" TextField="subject" 
                                            OnSelectedIndexChanged="ASPxFormLayout1_E8_SelectedIndexChanged" 
                                            AutoPostBack="True" ClientInstanceName="ASPxFormLayout1_E8">
                                        </dx:ASPxComboBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </layoutitemnestedcontrolcollection>
                            </dx:LayoutItem>
                            <dx:LayoutGroup Caption="Срабатывания">
                                <Items>
                                    <dx:LayoutItem Caption="Количество">
                                        <layoutitemnestedcontrolcollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" 
                                                SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E7" runat="server" Width="170px">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </layoutitemnestedcontrolcollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                            <dx:LayoutGroup Caption="Потенциал &quot;труба-земля&quot;" ColCount="3" 
                                GroupBoxDecoration="HeadingLine">
                                <Items>
                                    <dx:LayoutItem Caption="Минимальный">
                                        <layoutitemnestedcontrolcollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" 
                                                SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server" Width="170px">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </layoutitemnestedcontrolcollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Средний">
                                        <layoutitemnestedcontrolcollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" 
                                                SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E2" runat="server" Width="170px">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </layoutitemnestedcontrolcollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Максимальный">
                                        <layoutitemnestedcontrolcollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" 
                                                SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E3" runat="server" Width="170px">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </layoutitemnestedcontrolcollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                            <dx:LayoutGroup Caption="Потенциал &quot;рельс-земля&quot;" ColCount="3">
                                <Items>
                                    <dx:LayoutItem Caption="Минимальный">
                                        <layoutitemnestedcontrolcollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" 
                                                SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E4" runat="server" Width="170px">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </layoutitemnestedcontrolcollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Средний">
                                        <layoutitemnestedcontrolcollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" 
                                                SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E5" runat="server" Width="170px">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </layoutitemnestedcontrolcollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Максимальный">
                                        <layoutitemnestedcontrolcollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" 
                                                SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E6" runat="server" Width="170px">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </layoutitemnestedcontrolcollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                        </Items>
                    </dx:ASPxFormLayout>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource34" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PostgresConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:PostgresConnectionString.ProviderName %>" 
                        SelectCommand="select s.subject_name as subject, m.pot_tz as sum, m.pot_rz as pol, m.curr as curr, m.volt_akb as volt, m.state as state, m.reg_time as time from &quot;Monitoring_SDZ&quot; as m LEFT JOIN &quot;Subject&quot; as s on m.subject_id=s.subject_id">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PostgresConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:PostgresConnectionString.ProviderName %>" 
                        SelectCommand="select s.subject_name as subject from &quot;Monitoring_SDZ&quot; as m LEFT JOIN &quot;Subject&quot; as s on m.subject_id=s.subject_id GROUP BY s.subject_name">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PostgresConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:PostgresConnectionString.ProviderName %>" 
                        SelectCommand="select s.subject_name as subject, MAX(m.pot_tz) as sump, m.reg_time as time from &quot;Monitoring_SDZ&quot; as m LEFT JOIN &quot;Subject&quot; as s on m.subject_id=s.subject_id GROUP BY subject,time">
                    </asp:SqlDataSource>
                    <br />
                    <dxchartsui:WebChartControl ID="WebChartControl10" runat="server" 
                        CrosshairEnabled="True" CssClass="style=&quot;text-align:center&quot;" 
                        DataSourceID="SqlDataSource4" Height="400px" SeriesDataMember="subject" 
                        Width="800px">
                        <diagramserializable>
                            <cc2:XYDiagram>
                                <axisx title-text="Время" title-visible="True" visibleinpanesserializable="-1">
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><datetimescaleoptions aggregatefunction="None" autogrid="True" 
                                        measureunit="Hour">
                                    </datetimescaleoptions>
                                </axisx>
                                <axisy title-text="Потенциал, В" title-visible="True" 
                                    visibleinpanesserializable="-1">
                                </axisy>
                            </cc2:XYDiagram>
                        </diagramserializable>
                        <legend alignmentvertical="Center" UseCheckBoxes="True"></legend>
                        <seriestemplate argumentdatamember="time" argumentscaletype="DateTime" 
                            labelsvisibility="True" synchronizepointoptions="False" 
                            valuedatamembersserializable="sump">
                            <viewserializable>
                                <cc2:LineSeriesView>
                                </cc2:LineSeriesView>
                            </viewserializable>
                            <legendpointoptionsserializable>
                                <cc2:PointOptions PointView="ArgumentAndValues">
                                </cc2:PointOptions>
                            </legendpointoptionsserializable>
                        </seriestemplate>
                        <titles>
                            <cc2:ChartTitle Text="Потенциал &quot;труба-земля&quot;" />
                        </titles>
                    </dxchartsui:WebChartControl>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PostgresConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:PostgresConnectionString.ProviderName %>" 
                        SelectCommand="select s.subject_name as subject, MAX(m.pot_rz) as sump, m.reg_time as time from &quot;Monitoring_SDZ&quot; as m LEFT JOIN &quot;Subject&quot; as s on m.subject_id=s.subject_id GROUP BY subject,time">
                    </asp:SqlDataSource>
                    <br />
                    <dxchartsui:WebChartControl ID="WebChartControl11" runat="server" 
                        CrosshairEnabled="True" CssClass="style=&quot;text-align:center&quot;" 
                        DataSourceID="SqlDataSource5" Height="400px" SeriesDataMember="subject" 
                        Width="800px">
                        <diagramserializable>
                            <cc2:XYDiagram>
                                <axisx title-text="Время" title-visible="True" visibleinpanesserializable="-1">
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><datetimescaleoptions aggregatefunction="None" autogrid="True" 
                                        measureunit="Hour">
                                    </datetimescaleoptions>
                                </axisx>
                                <axisy title-text="Потенциал, В" title-visible="True" 
                                    visibleinpanesserializable="-1">
                                </axisy>
                            </cc2:XYDiagram>
                        </diagramserializable>
                        <legend alignmentvertical="Center" UseCheckBoxes="True"></legend>
                        <seriestemplate argumentdatamember="time" labelsvisibility="True" 
                            synchronizepointoptions="False" valuedatamembersserializable="sump">
                            <viewserializable>
                                <cc2:LineSeriesView>
                                </cc2:LineSeriesView>
                            </viewserializable>
                            <legendpointoptionsserializable>
                                <cc2:PointOptions PointView="ArgumentAndValues">
                                </cc2:PointOptions>
                            </legendpointoptionsserializable>
                        </seriestemplate>
                        <titles>
                            <cc2:ChartTitle Text="Потенциал &quot;рельс-земля&quot;" />
                        </titles>
                    </dxchartsui:WebChartControl>
                    <br />
                    <dx:ASPxPageControl ID="ASPxPageControl23" runat="server" ActiveTabIndex="0" 
                        Theme="Youthful">
                        <tabpages>
                            <dx:TabPage Text="Ток">
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:PostgresConnectionString %>" 
                                            ProviderName="<%$ ConnectionStrings:PostgresConnectionString.ProviderName %>" 
                                            SelectCommand="select s.subject_name as subject, MAX(m.curr) as sump, m.reg_time as time from &quot;Monitoring_SDZ&quot; as m LEFT JOIN &quot;Subject&quot; as s on m.subject_id=s.subject_id GROUP BY subject,time">
                                        </asp:SqlDataSource>
                                        <dxchartsui:WebChartControl ID="WebChartControl12" runat="server" 
                                            CrosshairEnabled="True" CssClass="style=&quot;text-align:center&quot;" 
                                            DataSourceID="SqlDataSource6" Height="400px" SeriesDataMember="subject" 
                                            Width="800px">
                                            <diagramserializable>
                                                <cc2:XYDiagram>
                                                    <axisx title-text="Время" title-visible="True" visibleinpanesserializable="-1">
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><datetimescaleoptions aggregatefunction="None" autogrid="True" 
                                                            measureunit="Hour">
                                                        </datetimescaleoptions>
                                                    </axisx>
                                                    <axisy title-text="Ток, А" title-visible="True" visibleinpanesserializable="-1">
                                                    </axisy>
                                                </cc2:XYDiagram>
                                            </diagramserializable>
                                            <legend alignmentvertical="Center" usecheckboxes="True"></legend>
                                            <seriestemplate argumentdatamember="time" labelsvisibility="True" 
                                                synchronizepointoptions="False" valuedatamembersserializable="sump">
                                                <viewserializable>
                                                    <cc2:LineSeriesView>
                                                    </cc2:LineSeriesView>
                                                </viewserializable>
                                                <legendpointoptionsserializable>
                                                    <cc2:PointOptions PointView="ArgumentAndValues">
                                                    </cc2:PointOptions>
                                                </legendpointoptionsserializable>
                                            </seriestemplate>
                                            <titles>
                                                <cc2:ChartTitle Text="Ток" />
                                            </titles>
                                        </dxchartsui:WebChartControl>
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Напряжение">
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:PostgresConnectionString %>" 
                                            ProviderName="<%$ ConnectionStrings:PostgresConnectionString.ProviderName %>" 
                                            SelectCommand="select s.subject_name as subject, MAX(m.volt_akb) as sump, m.reg_time as time from &quot;Monitoring_SDZ&quot; as m LEFT JOIN &quot;Subject&quot; as s on m.subject_id=s.subject_id GROUP BY subject,time">
                                        </asp:SqlDataSource>
                                        <dxchartsui:WebChartControl ID="WebChartControl13" runat="server" 
                                            CrosshairEnabled="True" CssClass="style=&quot;text-align:center&quot;" 
                                            DataSourceID="SqlDataSource7" Height="400px" SeriesDataMember="subject" 
                                            Width="800px">
                                            <diagramserializable>
                                                <cc2:XYDiagram>
                                                    <axisx title-text="Время" title-visible="True" visibleinpanesserializable="-1">
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                        <numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><datetimescaleoptions aggregatefunction="None" autogrid="True" 
                                                            measureunit="Hour">
                                                        </datetimescaleoptions>
                                                    </axisx>
                                                    <axisy title-text="Напряжение, В" title-visible="True" 
                                                        visibleinpanesserializable="-1">
                                                    </axisy>
                                                </cc2:XYDiagram>
                                            </diagramserializable>
                                            <legend alignmentvertical="Center" usecheckboxes="True"></legend>
                                            <seriestemplate argumentdatamember="time" labelsvisibility="True" 
                                                synchronizepointoptions="False" valuedatamembersserializable="sump">
                                                <viewserializable>
                                                    <cc2:LineSeriesView>
                                                    </cc2:LineSeriesView>
                                                </viewserializable>
                                                <legendpointoptionsserializable>
                                                    <cc2:PointOptions PointView="ArgumentAndValues">
                                                    </cc2:PointOptions>
                                                </legendpointoptionsserializable>
                                            </seriestemplate>
                                            <titles>
                                                <cc2:ChartTitle Text="Напряжение" />
                                            </titles>
                                        </dxchartsui:WebChartControl>
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                        </tabpages>
                    </dx:ASPxPageControl>
                </ContentTemplate>
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="БКМУ" Expanded="False">
                <ContentTemplate>
                    <dx:ASPxGridView ID="ASPxGridView14" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource31" EnableTheming="True" Theme="Youthful" 
                        CssClass="style=&quot;text-align:center&quot;">
                        <Columns>
                            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="Название" FieldName="subject" 
                                VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Сум. пот." FieldName="sum" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Пол. пот." FieldName="pol" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Ток" FieldName="curr" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Напряжение" FieldName="volt" 
                                VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Внутр. сопротивление" FieldName="temper" 
                                VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Состояние" FieldName="state" 
                                VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Время" FieldName="time" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                        <settings showfilterrow="True" showgrouppanel="True" />
                        <settings showfilterrow="True" showgrouppanel="True" />
                        <settingspager pagesize="20">
                        </settingspager>
                        <settings showfilterrow="True" showgrouppanel="True" />
                    </dx:ASPxGridView>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource31" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PostgresConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:PostgresConnectionString.ProviderName %>" 
                        SelectCommand="select s.subject_name as subject, m.sum_pot as sum, m.pol_pot as pol, m.curr as curr, m.volt as volt, m.temper as temper, m.state as state, m.reg_time as time from &quot;Monitoring_BKMU&quot; as m LEFT JOIN &quot;Subject&quot; as s on m.subject_id=s.subject_id">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PostgresConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:PostgresConnectionString.ProviderName %>" 
                        
                        SelectCommand="select s.subject_name as subject, MAX(m.sum_pot) as sump, m.reg_time as time from &quot;Monitoring_BKMU&quot; as m LEFT JOIN &quot;Subject&quot; as s on m.subject_id=s.subject_id GROUP BY subject,time">
                    </asp:SqlDataSource>
                    <br />
                                                        <dxchartsui:WebChartControl ID="WebChartControl10" runat="server" 
                                        CrosshairEnabled="True" DataSourceID="SqlDataSource4" Height="400px" 
                                        SeriesDataMember="subject" Width="800px" 
                        CssClass="style=&quot;text-align:center&quot;">
                                        <diagramserializable>
                                            <cc2:XYDiagram>
                                                <axisx title-text="Время" title-visible="True" visibleinpanesserializable="-1">
                                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><datetimescaleoptions aggregatefunction="None" autogrid="True" 
                                                      measureunit="Hour">
                                                    </datetimescaleoptions>
                                                </axisx>
                                                <axisy title-text="Потенциал, В" title-visible="True" 
                                                    visibleinpanesserializable="-1">
                                                </axisy>
                                            </cc2:XYDiagram>
                                        </diagramserializable>
                                        <legend alignmentvertical="Center" UseCheckBoxes="True"></legend>
                                        <seriestemplate argumentdatamember="time" labelsvisibility="True" 
                                            synchronizepointoptions="False" valuedatamembersserializable="sump" 
                                                                argumentscaletype="DateTime">
                                            <viewserializable>
                                                <cc2:LineSeriesView>
                                                </cc2:LineSeriesView>
                                            </viewserializable>
                                            <legendpointoptionsserializable>
                                                <cc2:PointOptions PointView="ArgumentAndValues">
                                                </cc2:PointOptions>
                                            </legendpointoptionsserializable>
                                        </seriestemplate>
                                        <titles>
                                            <cc2:ChartTitle Text="Суммарный потенциал" />
                                        </titles>
                                    </dxchartsui:WebChartControl>

                    <br />
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PostgresConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:PostgresConnectionString.ProviderName %>" 
                        SelectCommand="select s.subject_name as subject, MAX(m.pol_pot) as sump, m.reg_time as time from &quot;Monitoring_BKMU&quot; as m LEFT JOIN &quot;Subject&quot; as s on m.subject_id=s.subject_id GROUP BY subject,time">
                    </asp:SqlDataSource>
                    <br />
                    <dxchartsui:WebChartControl ID="WebChartControl112" runat="server" 
                        CrosshairEnabled="True" CssClass="style=&quot;text-align:center&quot;" 
                        DataSourceID="SqlDataSource5" Height="400px" SeriesDataMember="subject" 
                        Width="800px">
                        <diagramserializable>
                            <cc2:XYDiagram>
                                <axisx title-text="Время" title-visible="True" visibleinpanesserializable="-1">
                                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><datetimescaleoptions aggregatefunction="None" autogrid="True" 
                                                      measureunit="Hour">
                                                    </datetimescaleoptions>
                                </axisx>
                                <axisy title-text="Потенциал, В" title-visible="True" 
                                    visibleinpanesserializable="-1">
                                </axisy>
                            </cc2:XYDiagram>
                        </diagramserializable>
                        <legend alignmentvertical="Center" UseCheckBoxes="True"></legend>
                        <seriestemplate argumentdatamember="time" labelsvisibility="True" 
                            synchronizepointoptions="False" valuedatamembersserializable="sump">
                            <viewserializable>
                                <cc2:LineSeriesView>
                                </cc2:LineSeriesView>
                            </viewserializable>
                            <legendpointoptionsserializable>
                                <cc2:PointOptions PointView="ArgumentAndValues">
                                </cc2:PointOptions>
                            </legendpointoptionsserializable>
                        </seriestemplate>
                        <titles>
                            <cc2:ChartTitle Text="Поляризационный потенциал" />
                        </titles>
                    </dxchartsui:WebChartControl>

                    <br />
                    <dx:ASPxPageControl ID="ASPxPageControl21" runat="server" ActiveTabIndex="0" 
                        Theme="Youthful">
                        <tabpages>
                            <dx:TabPage Text="Ток">
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:PostgresConnectionString %>" 
                                            ProviderName="<%$ ConnectionStrings:PostgresConnectionString.ProviderName %>" 
                                            SelectCommand="select s.subject_name as subject, MAX(m.curr) as sump, m.reg_time as time from &quot;Monitoring_BKMU&quot; as m LEFT JOIN &quot;Subject&quot; as s on m.subject_id=s.subject_id GROUP BY subject,time">
                                        </asp:SqlDataSource>
                                        <dxchartsui:WebChartControl ID="WebChartControl12" runat="server" 
                                            CrosshairEnabled="True" CssClass="style=&quot;text-align:center&quot;" 
                                            DataSourceID="SqlDataSource6" Height="400px" SeriesDataMember="subject" 
                                            Width="800px">
                                            <diagramserializable>
                                                <cc2:XYDiagram>
                                                    <axisx title-text="Время" title-visible="True" visibleinpanesserializable="-1">
                                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><datetimescaleoptions aggregatefunction="None" autogrid="True" 
                                                      measureunit="Hour">
                                                    </datetimescaleoptions>
                                                    </axisx>
                                                    <axisy title-text="Ток, А" title-visible="True" 
                                                        visibleinpanesserializable="-1">
                                                    </axisy>
                                                </cc2:XYDiagram>
                                            </diagramserializable>
                                            <legend alignmentvertical="Center" usecheckboxes="True"></legend>
                                            <seriestemplate argumentdatamember="time" labelsvisibility="True" 
                                                synchronizepointoptions="False" valuedatamembersserializable="sump">
                                                <viewserializable>
                                                    <cc2:LineSeriesView>
                                                    </cc2:LineSeriesView>
                                                </viewserializable>
                                                <legendpointoptionsserializable>
                                                    <cc2:PointOptions PointView="ArgumentAndValues">
                                                    </cc2:PointOptions>
                                                </legendpointoptionsserializable>
                                            </seriestemplate>
                                            <titles>
                                                <cc2:ChartTitle Text="Ток" />
                                            </titles>
                                        </dxchartsui:WebChartControl>
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Напряжение">
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:PostgresConnectionString %>" 
                                            ProviderName="<%$ ConnectionStrings:PostgresConnectionString.ProviderName %>" 
                                            SelectCommand="select s.subject_name as subject, MAX(m.volt) as sump, m.reg_time as time from &quot;Monitoring_BKMU&quot; as m LEFT JOIN &quot;Subject&quot; as s on m.subject_id=s.subject_id GROUP BY subject,time">
                                        </asp:SqlDataSource>
                                        <dxchartsui:WebChartControl ID="WebChartControl13" runat="server" 
                                            CrosshairEnabled="True" CssClass="style=&quot;text-align:center&quot;" 
                                            DataSourceID="SqlDataSource7" Height="400px" SeriesDataMember="subject" 
                                            Width="800px">
                                            <diagramserializable>
                                                <cc2:XYDiagram>
                                                    <axisx title-text="Время" title-visible="True" visibleinpanesserializable="-1">
                                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" />
                                                    <numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><numericscaleoptions aggregatefunction="None" scalemode="Automatic" /><datetimescaleoptions aggregatefunction="None" autogrid="True" 
                                                      measureunit="Hour">
                                                    </datetimescaleoptions>
                                                    </axisx>
                                                    <axisy title-text="Напряжение, В" title-visible="True" 
                                                        visibleinpanesserializable="-1">
                                                    </axisy>
                                                </cc2:XYDiagram>
                                            </diagramserializable>
                                            <legend alignmentvertical="Center" usecheckboxes="True"></legend>
                                            <seriestemplate argumentdatamember="time" labelsvisibility="True" 
                                                synchronizepointoptions="False" valuedatamembersserializable="sump">
                                                <viewserializable>
                                                    <cc2:LineSeriesView>
                                                    </cc2:LineSeriesView>
                                                </viewserializable>
                                                <legendpointoptionsserializable>
                                                    <cc2:PointOptions PointView="ArgumentAndValues">
                                                    </cc2:PointOptions>
                                                </legendpointoptionsserializable>
                                            </seriestemplate>
                                            <titles>
                                                <cc2:ChartTitle Text="Напряжение" />
                                            </titles>
                                        </dxchartsui:WebChartControl>
                                    </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>
                        </tabpages>
                    </dx:ASPxPageControl>
                    <br />

                </ContentTemplate>
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="БСЗ" Expanded="False">
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="БКМУ+БСЗ" Expanded="False">
            </dx:NavBarGroup>
        </Groups>
    </dx:ASPxNavBar>
                                    
<br />

                                    
</asp:Content>
