<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NotFound.aspx.cs" Inherits="BooksLibrary.Web.ErrorPages.NotFound" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="notFoundWrapper" class="text-center">
        <h1>404</h1>
        <h1>Not Found!</h1>
        <p>
            The page you are looking for is definitely not here.
        </p>
        <div>
            <a class="btn btn-primary" href="/">Go Home</a>
        </div>
    </div>

</asp:Content>
