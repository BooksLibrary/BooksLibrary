<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="All.aspx.cs" Inherits="BooksLibrary.Web.Authors.All1" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:ListView runat="server">
    </asp:ListView>
    <asp:GridView runat="server" ID="AuthorsGridView" AutoGenerateColumns="False" DataKeyNames="Id" class="table table-striped table-hover"
        SelectMethod="AuthorsGridView_GetData"
        AllowPaging="True"
        AllowSorting="True"
        OnPageIndexChanged="AuthorsGridView_PageIndexChanged"
        PageSize="5">
        <EmptyDataTemplate>
            <h1>There are no authors yet!</h1>
        </EmptyDataTemplate>
        <Columns>
            <asp:ImageField DataImageUrlField="ImageUrl" HeaderText="Image" ControlStyle-CssClass="author-thumbnail" NullImageUrl="~/Uploads/authorImages/default.jpg">
                <ControlStyle CssClass="author-thumbnail"></ControlStyle>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:ImageField>
            <asp:BoundField DataField="Name" HeaderText="Author Name" SortExpression="Name">
                <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="Info" HeaderText="Author Info"></asp:BoundField>
            <asp:HyperLinkField Text="Books" NavigateUrl='/books/all?authorId=<% Eval("Id") %>' runat="server" />
        </Columns>
        <PagerSettings PageButtonCount="5" />
    </asp:GridView>
</asp:Content>
