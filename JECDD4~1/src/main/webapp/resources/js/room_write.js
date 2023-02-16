 function PostCall() {
    	var roadAddr = "";
    	daum.postcode.load(function(){
            new daum.Postcode({
            	 oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 				roadAddr = data.roadAddress; // 도로명 주소 변수

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("PostNumber").value = data.zonecode;
                document.getElementById("room_roadaddress").value = roadAddr;
              	updateLatLng(roadAddr);
              	insertMarker(roadAddr);
          		}
       		}).open();
   		})
    }
    
    function updateLatLng(roadAddr){    	
    	 var geocoder = new kakao.maps.services.Geocoder();
	 	 geocoder.addressSearch(roadAddr, function(result, status) {
	 		if (status === kakao.maps.services.Status.OK) {
		  		coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			  	var html = "";
			  	html += '<input type="hidden" name="room_lat" value="'+ result[0].y +'" >';
			  	html += '<input type="hidden" name="room_lng" value="'+ result[0].x +'" >'
			  	$("#roadAdd").html(html);
			 }
		});
   	 
   	 
    }
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level: 4 // 지도의 확대 레벨
		};  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

function insertMarker(road){
			var geocoder = new kakao.maps.services.Geocoder();
			geocoder.addressSearch(road, function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					coords = new kakao.maps.LatLng(result[0].y, result[0].x);	
					var marker = new kakao.maps.Marker({
						map: map,
					    position: coords,
					});
					
					map.setCenter(coords);
				}
			});
}
    
// 파일 리스트 번호
   var fileIndex = 0;
   // 등록할 전체 파일 사이즈
   var totalFileSize = 0;
   // 파일 리스트
   var fileList = new Array();
   // 파일 사이즈 리스트
   var fileSizeList = new Array();
   // 등록 가능한 파일 사이즈 MB
   var uploadSize = 50;
   // 등록 가능한 총 파일 사이즈 MB
   var maxUploadSize = 500;

   $(function (){
       // 파일 드롭 다운
       fileDropDown();
   });

   // 파일 드롭 다운
   function fileDropDown(){
       var dropZone = $("#dropBox");
       //Drag기능 
       dropZone.on('dragenter',function(e){
           e.stopPropagation();
           e.preventDefault();
           // 드롭다운 영역 css
           $(this).css('border', '2px solid #5272A0');
       });
       dropZone.on('dragleave',function(e){
           e.stopPropagation();
           e.preventDefault();
           // 드롭다운 영역 css
           $(this).css('border', '2px dotted #8296C2');
       });
       dropZone.on('dragover',function(e){
           e.stopPropagation();
           e.preventDefault();
           // 드롭다운 영역 css
       });
       dropZone.on('drop',function(e){
           e.preventDefault();
           // 드롭다운 영역 css
           $(this).css('border', '2px dotted #8296C2');
           
           var files = e.originalEvent.dataTransfer.files;
           if(files != null){
               if(files.length >= 1){
	           		selectFile(files)
               }else{
            	   alert("폴더 업로드 불가");
                   return;
               }
           }else{
               alert("ERROR");
           }
       });
   }

   // 파일 선택시
   function selectFile(files){
       // 다중파일 등록
       if(files != null){
           for(var i = 0; i < files.length; i++){
               // 파일 이름
               var fileName = files[i].name;
               var fileNameArr = fileName.split("\.");
               // 확장자
               var ext = fileNameArr[fileNameArr.length - 1];
               // 파일 사이즈(단위 :MB)
               var fileSize = files[i].size / 1024 / 1024;
               
               if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) >= 0){
                   // 확장자 체크
                   alert("등록 불가 확장자");
                   break;
               }else if(fileSize > uploadSize){
                   // 파일 사이즈 체크
                   alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                   break;
               }else{
                   // 전체 파일 사이즈
                   totalFileSize += fileSize;
                   
                   // 파일 배열에 넣기
                   fileList[fileIndex] = files[i];
                   
                   // 파일 사이즈 배열에 넣기
                   fileSizeList[fileIndex] = fileSize;

                   // 업로드 파일 목록 생성
                   addFileList(fileIndex, fileName, fileSize, files);

                   // 파일 번호 증가
                   fileIndex++;
               }
           }
       }else{
           alert("ERROR");
       }
   }

   // 업로드 파일 목록 생성
   function addFileList(fIndex, fileName, fileSize, files){
	  
       var html = "";
       html += "<div id='fileTr_" + fIndex + "'>";
       html += " 	<div class='right' >";
       html += "	   <img src="+window.URL.createObjectURL(files[fIndex])+"></div>"
       html += "    <div class='left' >";
       html += fileName + "<span onclick='deleteFile(" + fIndex + "); return false;' ><i class='fa fa-times'></i></span>"
       html += "    </div>";
       html += "</div>";

       $('#imgContainer').append(html);
   }

   // 업로드 파일 삭제
   function deleteFile(fIndex){
       // 전체 파일 사이즈 수정
       totalFileSize -= fileSizeList[fIndex];
       
       // 파일 배열에서 삭제
       delete fileList[fIndex];
       
       // 파일 사이즈 배열 삭제
       delete fileSizeList[fIndex];
       
       // 업로드 파일 테이블 목록에서 삭제
       $("#fileTr_" + fIndex).remove();
   }

   // 파일 등록
   function uploadFile(){
       // 등록할 파일 리스트
       var uploadFileList = Object.keys(fileList);
       console.log(formData);
       // 파일이 있는지 체크
       if(uploadFileList.length == 0){
           // 파일등록 경고창
           alert("파일이 없습니다.");
           return;
       }
       
       // 용량을 500MB를 넘을 경우 업로드 불가
       if(totalFileSize > maxUploadSize){
           // 파일 사이즈 초과 경고창
           alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
           return;
       }
   }
   $(document).on("dragover drop", function(e) {
	    e.preventDefault();
	}).on("drop", function(e) {
	    $("input[type='file']")
	        .prop("files", e.originalEvent.dataTransfer.files)
	        .closest("form")
	});
   

   
