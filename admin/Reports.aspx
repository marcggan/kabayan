<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="admin_Reports" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <rsweb:ReportViewer class="gv" ID="ReportViewer1" runat="server" 
        Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" 
        ZoomMode="FullPage">
        <LocalReport ReportPath="admin\Report1.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="Report" Name="Test" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>


    <asp:SqlDataSource ID="Report" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [rooms]"></asp:SqlDataSource>


    <script language="javascript" type="text/javascript">
        ResizeReport();

        function ResizeReport() {
            var viewer = document.getElementById("<%= ReportViewer1.ClientID %>");
            var htmlheight = document.documentElement.clientHeight;
            viewer.style.height = "1100px";
            viewer.style.width = "850px";
        }

        window.onresize = function resize() { ResizeReport(); }
    </script>
</asp:Content>

