<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Good-Buy</title>
<style type="text/css">
#sendMsg_tb,#sendMsg_tb tr, #sendMsg_tb td , #sendMsg_tb th{
    border-collapse:collapse;
    
  }
  #sendMsg_tb{
      margin: auto;
      width: 100%;
      height: 100%;
  }
  
  #sendMsg_tb p{
      opacity: 0.95;
    font-size: 25px;
    font-weight: bold;
  }
  #sendMsg_tb tr:nth-child(1){
    background-color: #f9f9f9;
  }
  #sendMsg_tb tr:nth-child(3){
      font-size: 14px;
      color:#555353;
      font-weight: lighter;
  }
  #sendMsg_tb textarea{
    width: 100%;
    height: 250px;
   font-size: 16px;
  resize: none;
 margin-bottom: 30px;
  background-color: #f9f9f9;
  border: 0px;
  }
  #greset{
        
      width: 171px;
        height: 47px;
        border-radius: 27px;
        font-size: 16px;
        border: solid 1px #000000;
        background-color: #ffffff;
        font-size: 16px;
        font-weight: bold;
      }
      #gsubmit{
     
        width: 160px;
        height: 40px;
        border-radius: 27px;
        font-size: 16px;
        background-color: #000000;
        border: 0px;
      color : white;
      font-size: 16px;
      font-weight: bold;
      }

      .titleWrap{
        margin-top:30px;
        text-align: center;
        height: 30px;;
    }
    .circle{
        display:inline-block;
        width:15px;
        height:15px;
        background: #05AAD1;
        border-radius: 50px;   
        margin-top:7px;
    }
    .circle:nth-child(1){margin-right:10px;}
    .circle:nth-child(3){margin-left:10px;}

    .sendMSG{font-size:18px;font-weight: bold;}

  
</style>
</head>
<body>
   <div class="titleWrap">
        <span class="circle"></span>
        <span class="sendMSG">Send Message</span>
        <span class="circle"></span>
    </div>
    <table id="sendMsg_tb">
        <tr style="height: 80px;">
            <th>
                <img src="${ contextPath }/resources/images/user.png" width="40px" style="margin-left: 180%;"> 
               
            </th>
            <th><span  style="margin-left:-20%;">데세해</span></th>
        </tr>
        <tr>
            <td rowspan="2" style="width: 100px;"><img src="${ contextPath }/resources/images/goods.jpeg" width="100px"></td>
            <td>뉴발란스 신발 팝니당</td>
        </tr>
        <tr>
            <td>230,000원</td>
        </tr>

        <tr>
            <td colspan="2"><textarea></textarea></td>
        </tr>
        <tr>
        <th  colspan="2"><button type="submit" id="gsubmit" >보내기</button></th>    
        </tr>

    </table>
</body>
</html>