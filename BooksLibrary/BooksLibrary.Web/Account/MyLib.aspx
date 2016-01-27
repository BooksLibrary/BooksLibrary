<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyLib.aspx.cs" EnableEventValidation="false" Inherits="BooksLibrary.Web.Account.MyLib" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>My library:</h1>
    <asp:Repeater ID="RepeaterBooks" runat="server" ItemType="BooksLibrary.Models.Book">
        <ItemTemplate>
            <div id="myLibContainer" class="row">
                <div class="col-md-9">
                    <div class="thumbnail">
                        <img class="img-responsive" src="http://placehold.it/800x300" alt="bookImage">
                        <div class="caption-full">
                            <h4><a href="/Books/Details?id= <%#:Item.Id %>"><%#: Item.Title %></a></h4>
                            <p><%#: Item.Description %></p>
                        </div>
                        <div>
                            <a href="ReadBook?id=<%#:Item.Id %>" class="btn btn-primary">Read</a>
                            <asp:Button Text="Remove" CssClass="btn btn-danger" ID="btnRemove" OnCommand="RemoveFromMyLib" CommandArgument="<%#: Item.Id %>" runat="server" />
                        </div>
                    </div>
                    <hr />
                </div>
            </div>

        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
