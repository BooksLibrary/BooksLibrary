<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServerError.aspx.cs" Inherits="BooksLibrary.Web.ErrorPages.ServerError" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="serverErrorWrapper" class="text-center">
        <h1>500 Internal Server Error</h1>
        <p>
            Try again later!
        </p>
        <div>
            <a class="btn btn-primary" href="/">Go Home</a>
        </div>
    </div>
</asp:Content>
