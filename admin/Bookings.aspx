<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Bookings.aspx.cs" Inherits="admin_Bookings" %>
<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="js/modal.js"></script>
    <link href='css/calendar.css' type="text/css" rel="stylesheet" /> 
    <link href='Themes/scheduler_white.css' type="text/css" rel="stylesheet" /> 
	<script type="text/javascript">

	    var modal = new DayPilot.Modal();
	    modal.border = "10px solid #ccc";
	    modal.closed = function () {
	        if (this.result == "OK") {
	            dps.commandCallBack('refresh');
	        }
	    };

	    function createEvent(start, end, resource) {
	        modal.height = 400;
	        modal.top = 80;
	        modal.showUrl("AddBooking.aspx?start=" + start.toStringSortable() + "&end=" + end.toStringSortable() + "&r=" + resource);
	    }

	    function editEvent(id) {
	        modal.height = 400;
	        modal.top = 80;
	        modal.showUrl("EditBooking.aspx?id=" + id);
	    }

	    function afterRender(data) {
	    };

	    function filter(property, value) {
	        if (!dps.clientState.filter) {
	            dps.clientState.filter = {};
	        }
	        if (dps.clientState.filter[property] != value) { // only refresh when the value has changed
	            dps.clientState.filter[property] = value;
	            dps.commandCallBack('filter');
	        }
	    }
	</script>
    <style type="text/css">
        .scheduler_white_rowheader 
        {
            background: -webkit-gradient(linear, left top, left bottom, from(#eeeeee), to(#dddddd));
	        background: -moz-linear-gradient(top, #eeeeee 0%, #dddddd);
	        background: -ms-linear-gradient(top, #eeeeee 0%, #dddddd);
	        background: -webkit-linear-gradient(top, #eeeeee 0%, #dddddd);
	        background: linear-gradient(top, #eeeeee 0%, #dddddd);
	        filter: progid:DXImageTransform.Microsoft.gradient(startColorStr="#eeeeee", endColorStr="#dddddd");

        }
        .scheduler_white_rowheader_inner 
        {
        	border-right: 1px solid #ccc;
        }
        .scheduler_white_rowheadercol2
        {
    	    background: White;
        }
        .scheduler_white_rowheadercol2 .scheduler_white_rowheader_inner 
        {
    	    top: 2px;
    	    bottom: 2px;
    	    left: 2px;
    	    background-color: transparent;
	        border-left: 5px solid #1a9d13; /* green */
	        border-right: 0px none;
        }
        .status_maintenance.scheduler_white_rowheadercol2 .scheduler_white_rowheader_inner
        {
	        border-left: 5px solid #ea3624; /* red */
        }
        .status_dirty.scheduler_white_rowheadercol2 .scheduler_white_rowheader_inner
        {
	        border-left: 5px solid #f9ba25; /* orange */
        }
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="calendar">
    <DayPilot:DayPilotScheduler 
        ID="DayPilotScheduler1" 
        runat="server" 
        
        DataStartField="bookingStart" 
        DataEndField="bookingEnd" 
        DataTextField="customerName" 
        DataIdField="bookingId"
        DataResourceField="roomId" 
        DataTagFields="bookingStatus"
        
        ClientObjectName="dps"
        
        CellGroupBy="Month"
        CellDuration="1440"
        Days="365"
        
        HeightSpec="Max"
        Height="350"
        Width="100%"
        HeaderFontSize="8pt"
        EventFontSize="8pt"
        
        EventMoveHandling="CallBack" 
        OnEventMove="DayPilotScheduler1_EventMove" 
        
        EventResizeHandling="CallBack"
        OnEventResize="DayPilotScheduler1_EventResize"
        
        TimeRangeSelectedHandling="JavaScript"
        TimeRangeSelectedJavaScript="createEvent(start, end, column);" 
        
        OnCommand="DayPilotScheduler1_Command"
        
        EventClickHandling="JavaScript"
        EventClickJavaScript="editEvent(e.value());" 
        
        AfterRenderJavaScript="afterRender(data);" 

        
        OnBeforeEventRender="DayPilotScheduler1_BeforeEventRender" OnBeforeCellRender="DayPilotScheduler1_BeforeCellRender"

        CssOnly="true"
        CssClassPrefix="scheduler_white"
        RowHeaderWidthAutoFit="true"
        EventHeight="50"
        DurationBarVisible="true"
        SyncResourceTree="false"
        
        OnBeforeResHeaderRender="DayPilotScheduler1_BeforeResHeaderRender"

        >
        <HeaderColumns>
            <DayPilot:RowHeaderColumn Title="Room" Width="80" />
            <DayPilot:RowHeaderColumn Title="Size" Width="80" />
            <DayPilot:RowHeaderColumn Title="Status" Width="80" />

        </HeaderColumns>
    </DayPilot:DayPilotScheduler>
    </div>
    <br />
    <div class="container">
        <div class="row"></div>
            <div class="col-xs-4 col-xs-offset-4">
            <asp:Button class="btn btn-block btn-primary" ID="btnBack" runat="server" Text="Back" 
                onclick="btnBack_Click" CausesValidation="False" />
            </div>
        </div>
</asp:Content>

