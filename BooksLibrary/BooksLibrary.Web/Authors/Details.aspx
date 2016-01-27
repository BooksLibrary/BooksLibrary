<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Details.aspx.cs" Inherits="BooksLibrary.Web.Authors.Details1" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:FormView runat="server" ID="AuthorDetailsFormview"
        SelectMethod="AuthorDetailsView_GetItem"
        ItemType="BooksLibrary.Models.Author">
        <ItemTemplate>
            <div class="jumbotron col-md-8 col-md-offset-5">
                <asp:Image runat="server" ImageUrl="<%# Item.ImageUrl %>" Height="200" AlternateText="No Image"/>
                <h1><%#:Item.Name %></h1>
                <p><%#:Item.Info %></p>
                <p><a class="btn btn-primary btn-lg" href="/books/all?author=<%# Item.Id %>">Books</a></p>
            </div>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
