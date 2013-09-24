<%@ Page Title="" Language="C#" MasterPageFile="~/test.Master" AutoEventWireup="true" CodeBehind="page.aspx.cs" Inherits="TrafficDey.page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>Welcome to the site, you must log in to enter</p>

    <div class="control-group">
        <label class="control-label" for="inputEmail">Email</label>
        <div class="input-group input-group-sm">
            <asp:TextBox runat="server" ID="txtEmail" placeholder="Email" CssClass="form-control"></asp:TextBox>

        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="inputPassword">Password</label>
        <div class="controls">
            <input type="password" id="inputPassword" placeholder="Password">
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <label class="checkbox">
                <input type="checkbox">
                Remember me 
            </label>
            <button type="submit" class="btn">Sign in</button>
            <asp:Button runat="server" CssClass="btn" Text="Test" />
            <asp:Panel runat="server" CssClass="alert alert-info">Panel text here. Just try it
                <asp:Button ID="Button4" runat="server" CssClass="close" Text="x" /></asp:Panel>
        </div>
    </div>

    <div class="btn-group btn-group-lg">
        <asp:Button runat="server" CssClass="btn btn-danger" Text="BTN" />
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-default" Text="BTN" />
        <asp:Button ID="Button2" runat="server" CssClass="btn btn-info" Text="BTN" />
        <asp:Button ID="Button3" runat="server" CssClass="btn btn-inverse" Text="BTN" />
        <%--  <asp:Button ID="Button4" runat="server" CssClass="btn btn-link" Text="BTN" />--%>
        <asp:Button ID="Button5" runat="server" CssClass="btn btn-success" Text="BTN" />
        <%--<asp:Button ID="Button6" runat="server" CssClass="btn btn-toolbar" Text="BTN" />--%>
        <asp:Button ID="Button7" runat="server" CssClass="btn btn-warning" Text="BTN" />
        <asp:Button ID="Button8" runat="server" CssClass="btn btn-info" Text="BTN" />
        <asp:Button ID="Button9" runat="server" CssClass="btn btn-danger" Text="BTN" />

    </div>


    <div class="btn-group">
        <button type="button" class="btn btn-default">1</button>
        <button type="button" class="btn btn-default">2</button>

        <div class="btn-group">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                Dropdown
      <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="#">Dropdown link</a></li>
                <li><a href="#">Dropdown link</a></li>
            </ul>
        </div>
    </div>
    <div class="input-group">
        <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="input-group input-group-lg">
        <span class="input-group-addon">@</span>
        <input type="text" class="form-control" placeholder="Username">
    </div>

    <div class="input-group input-group-sm">
        <input type="text" class="form-control">
        <span class="input-group-addon">.00</span>
    </div>

    <div class="input-group">
        <span class="input-group-addon">$</span>
        <input type="text" class="form-control">
        <span class="input-group-addon">.00</span>
    </div>

    <ul class="nav nav-tabs nav-justified">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">Profile</a></li>
        <li><a href="#">Messages</a></li>
    </ul>
    <asp:Panel runat="server" CssClass="alert alert-success alert-dismissable">
        This is some message here... <a href="#" class="alert-link">link in here</a>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <%-- <asp:Button UseSubmitBehavior="false" runat="server" CssClass="close" aria-hidden="true" data-dismiss="alert" Text="&times;" ></asp:Button>--%>
    </asp:Panel>
    <div class="alert alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <strong>Warning!</strong> Best check yo self, you're not looking too good.
    </div>
    <asp:Panel runat="server" CssClass="panel panel-success fade in">
        <asp:Button runat="server" CssClass="close" data-dismiss="alert" aria-hidden="true" Text="&times;" />
        <div class="panel-heading">
            Header
        </div>
        <div class="panel-body">
            This is the body here
        </div>
    </asp:Panel>

    <h3>Static popover</h3>
   <h3>Live demo</h3>
    <div class="bs-example" style="padding-bottom: 24px;">
      <a href="#" class="btn btn-lg btn-danger" data-toggle="popover" title="A Title" data-content="And here's some amazing content. It's very engaging. right?">Click to toggle popover</a>
    </div>
    <div class="input-group input-group-lg">
        <asp:TextBox runat="server" CssClass="form-control form-search"></asp:TextBox><asp:Button runat="server" CssClass="btn form-search" Text="Bless" />
    </div>
    <asp:Button runat="server" CssClass="btn" Text="<span class='glyphicon glyphicon-star'></span> Star">
      
    </asp:Button>
    
</asp:Content>
