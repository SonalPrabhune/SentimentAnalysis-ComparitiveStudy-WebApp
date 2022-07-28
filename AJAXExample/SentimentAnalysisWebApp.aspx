<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="SentimentAnalysisWebApp.aspx.cs" Inherits="AJAXExample.AJAXExample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="styles.css">
    

   
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
        <ContentTemplate>
            <table align="center" border="0">
                <tr>
                    <td ><img src="word.jpg" style="height: 300px; width: 603px" /></td>
                        
                        <td class="TopCaption">Sentiment Analysis</td>
                    </caption>

                </tr>
                <tr>
                   
                    <td class="InputData" colspan="2">
                        <asp:TextBox ID="txtName" runat="server" Rows="10" TextMode="MultiLine" Width="1200px"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>

                    <td align="right" colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" Text="Initiate Analysis" OnClick="btnSubmit_Click" CssClass="MyButton" Height="29px" Width="209px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    
                    <td colspan="2" align="center">
                         <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <h2 class="analysis" >Analysis in Progress, Please wait...</h2>
                    <div id="ajaxloader">
                        <asp:Image ID="Image1" runat="server" ImageUrl="loading.gif" Height="108px" Width="325px" />                        
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
                    </td></tr>
                    <tr>
                        <td colspan="2">                        
                            <table id="Sub" border="1" width="100%">
                            <tr>
                                <td class="BertHeader">BERT</td>
                                <td class="NLTKHeader">NLTK</td>
                                <td class="RNNHeader">RNN</td>
                             </tr>
                             <tr>
                                <td width="400px" class="BertBody"><asp:Label ID="lblMsgBert" runat="server" /></td>
                                <td width="400px" class="NLTKBody"><asp:Label ID="lblMsgNLTK" runat="server" /></td>
                                <td width="400px" class="RNNBody"><asp:Label ID="lblMsgRNN" runat="server" /></td>
                             </tr>
                            </table>
                        </td>
                    </tr>
                    
            </table>
           
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
