<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyLib.aspx.cs" Inherits="BooksLibrary.Web.Account.MyLib" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Repeater ID="RepeaterBooks" runat="server" ItemType="BooksLibrary.Models.Book">
        <ItemTemplate>
            <div class="row">
                <div class="col-md-9">
                    <div class="thumbnail">
                        <img class="img-responsive" src="http://placehold.it/800x300" alt="bookImage">
                        <div class="caption-full">
                            <h4><a href="#">Product Name</a></h4>
                            <p>See more snippets like these online store reviews at <a target="_blank" href="http://bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
                        </div>
                        <div>
                            <asp:Button Text="Read" runat="server" />
                        </div>
                    </div>
                    <hr />
                </div>
            </div>

        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
