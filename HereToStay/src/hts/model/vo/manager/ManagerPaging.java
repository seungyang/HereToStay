package hts.model.vo.manager;

public class ManagerPaging {
 
	private int pageSize;  // 한 페이지에 보여줄 게시글 수
    private int pageBlock; //페이징 네비[블록] 사이즈
    private int pageNo;  // 페이지 번호
    private int pageNo1;
    private int pageNo2;
    private int startRowNo; //조회 시작 row 번호
    private int endRowNo; //조회 마지막 now 번호
    private int startRowNo1; //조회 시작 row 번호
    private int endRowNo1; //조회 마지막 now 번호
    private int startRowNo2; //조회 시작 row 번호
    private int endRowNo2; //조회 마지막 now 번호
    private int firstPageNo; // 첫 번째 페이지 번호
    private int finalPageNo; // 마지막 페이지 번호
    private int prevPageNo; // 이전 페이지 번호
    private int nextPageNo; // 다음 페이지 번호
    private int startPageNo; // 시작 페이지 (페이징 네비 기준)
    private int endPageNo; // 끝 페이지 (페이징 네비 기준)
    private int totalCount; // 게시 글 전체 수
    private int totalCount1; // 게시 글 전체 수
    private int totalCount2; // 게시 글 전체 수


    public int getStartRowNo1() {
		return startRowNo1;
	}
	public void setStartRowNo1(int startRowNo1) {
		this.startRowNo1 = startRowNo1;
	}
	public int getEndRowNo1() {
		return endRowNo1;
	}
	public void setEndRowNo1(int endRowNo1) {
		this.endRowNo1 = endRowNo1;
	}
	public int getStartRowNo2() {
		return startRowNo2;
	}
	public void setStartRowNo2(int startRowNo2) {
		this.startRowNo2 = startRowNo2;
	}
	public int getEndRowNo2() {
		return endRowNo2;
	}
	public void setEndRowNo2(int endRowNo2) {
		this.endRowNo2 = endRowNo2;
	}
	public int getPageNo1() {
		return pageNo1;
	}
	public void setPageNo1(int pageNo1) {
		this.pageNo1 = pageNo1;
	}
	public int getPageNo2() {
		return pageNo2;
	}
	public void setPageNo2(int pageNo2) {
		this.pageNo2 = pageNo2;
	}
	public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public int getPageBlock() {
        return pageBlock;
    }
    public void setPageBlock(int pageBlock) {
        this.pageBlock = pageBlock;
    }
    public int getPageNo() {
        return pageNo;
    }
    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }
    public int getStartRowNo() {
        return startRowNo;
    }
    public void setStartRowNo(int startRowNo) {
        this.startRowNo = startRowNo;
    }
    public int getEndRowNo() {
        return endRowNo;
    }
    public void setEndRowNo(int endRowNo) {
         this.endRowNo = endRowNo;
    }
    public int getFirstPageNo() {
        return firstPageNo;
    }
    public void setFirstPageNo(int firstPageNo) {
        this.firstPageNo = firstPageNo;
    }
    public int getFinalPageNo() {
        return finalPageNo;
    }
    public void setFinalPageNo(int finalPageNo) {
        this.finalPageNo = finalPageNo;
    }
    public int getPrevPageNo() {
        return prevPageNo;
    }
    public void setPrevPageNo(int prevPageNo) {
        this.prevPageNo = prevPageNo;
    }
    public int getNextPageNo() {
        return nextPageNo;
    }
    public void setNextPageNo(int nextPageNo) {
        this.nextPageNo = nextPageNo;
    }
    public int getStartPageNo() {
        return startPageNo;
    }
    public void setStartPageNo(int startPageNo) {
        this.startPageNo = startPageNo;
    }
    public int getEndPageNo() {
        return endPageNo;
    }
    public void setEndPageNo(int endPageNo) {
        this.endPageNo = endPageNo;
    }
    public int getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        this.makePaging();
    }

    public int getTotalCount1() {
		return totalCount1;
	}
	public void setTotalCount1(int totalCount1) {
		this.totalCount1 = totalCount1;
		 this.makePaging1();
	}
	public int getTotalCount2() {
		return totalCount2;
	}
	public void setTotalCount2(int totalCount2) {
		this.totalCount2 = totalCount2;
		 this.makePaging2();
	}
	private void makePaging() {
  
        // 기본 값 설정
        if (this.totalCount == 0) return; 
        if (this.pageNo == 0) this.setPageNo(1);   //기본 페이지 번호
        if (this.pageSize == 0) this.setPageSize(6); //기본 페이지 리스트 사이즈
        if (this.pageBlock == 0 ) this.setPageBlock(5); //기본 페이지 네비[블록] 사이즈
        
        //--[첫 페이지], [마지막 페이지] 계산
        int finalPage = (totalCount + (pageSize - 1)) / pageSize; // 마지막 페이지
        this.setFirstPageNo(1);   // 첫 번째 페이지 번호
        this.setFinalPageNo(finalPage); // 마지막 페이지 번호
        
        //-- [이전] , [다음] 페이지 계산
        boolean isNowFirst = pageNo == 1 ? true : false;    // 시작 페이지 (전체)
        boolean isNowFinal = pageNo == finalPage ? true : false;  // 마지막 페이지 (전체)
        if (isNowFirst) {
            this.setPrevPageNo(1); // 이전 페이지 번호
        } else {
            this.setPrevPageNo(((pageNo - 1) < 1 ? 1 : (pageNo - 1))); // 이전 페이지 번호
        }
        if (isNowFinal) {
            this.setNextPageNo(finalPage); // 다음 페이지 번호
        } else {
            this.setNextPageNo(((pageNo + 1) > finalPage ? finalPage : (pageNo + 1))); // 다음 페이지 번호
        }
                
        //-- 페이징 네비[블록]을 계산
        int startPage = ((pageNo - 1) / pageBlock) * pageBlock + 1; // 시작 페이지 (페이징 네비 기준)
        int endPage = startPage + pageBlock - 1;      // 끝 페이지 (페이징 네비 기준)
        // 페이징 네비가 만약 [20-30] 인데 마지막 페이지가 28 인 경우 
        // [29, 30] 페이지는 페이징 네비에 미노출 해야 한다.
        if (endPage > finalPage) { // [마지막 페이지 (페이징 네비 기준) > 마지막 페이지] 보다 큰 경우 
            endPage = finalPage;  
        }
        this.setStartPageNo(startPage); // 시작 페이지 (페이징 네비 기준)
        this.setEndPageNo(endPage);  // 끝 페이지 (페이징 네비 기준)

        //--조회 시작 row, 조회 마지막 row 계산
        int startRowNo = ( (pageNo-1) * pageSize ) + 1;
        int endRowNo = pageNo * pageSize; 
        setStartRowNo( startRowNo );
        setEndRowNo( endRowNo );
    }
	private void makePaging1() {
		  
        // 기본 값 설정
        if (this.totalCount1 == 0) return; 
        if (this.pageNo1 == 0) this.setPageNo1(1);   //기본 페이지 번호
        if (this.pageSize == 0) this.setPageSize(6); //기본 페이지 리스트 사이즈
        if (this.pageBlock == 0 ) this.setPageBlock(5); //기본 페이지 네비[블록] 사이즈
        
        //--[첫 페이지], [마지막 페이지] 계산
        int finalPage = (totalCount1 + (pageSize - 1)) / pageSize; // 마지막 페이지
        this.setFirstPageNo(1);   // 첫 번째 페이지 번호
        this.setFinalPageNo(finalPage); // 마지막 페이지 번호
        
        //-- [이전] , [다음] 페이지 계산
        boolean isNowFirst = pageNo1 == 1 ? true : false;    // 시작 페이지 (전체)
        boolean isNowFinal = pageNo1 == finalPage ? true : false;  // 마지막 페이지 (전체)
        if (isNowFirst) {
            this.setPrevPageNo(1); // 이전 페이지 번호
        } else {
            this.setPrevPageNo(((pageNo1 - 1) < 1 ? 1 : (pageNo1 - 1))); // 이전 페이지 번호
        }
        if (isNowFinal) {
            this.setNextPageNo(finalPage); // 다음 페이지 번호
        } else {
            this.setNextPageNo(((pageNo1 + 1) > finalPage ? finalPage : (pageNo1 + 1))); // 다음 페이지 번호
        }
                
        //-- 페이징 네비[블록]을 계산
        int startPage = ((pageNo1 - 1) / pageBlock) * pageBlock + 1; // 시작 페이지 (페이징 네비 기준)
        int endPage = startPage + pageBlock - 1;      // 끝 페이지 (페이징 네비 기준)
        // 페이징 네비가 만약 [20-30] 인데 마지막 페이지가 28 인 경우 
        // [29, 30] 페이지는 페이징 네비에 미노출 해야 한다.
        if (endPage > finalPage) { // [마지막 페이지 (페이징 네비 기준) > 마지막 페이지] 보다 큰 경우 
            endPage = finalPage;  
        }
        this.setStartPageNo(startPage); // 시작 페이지 (페이징 네비 기준)
        this.setEndPageNo(endPage);  // 끝 페이지 (페이징 네비 기준)

        //--조회 시작 row, 조회 마지막 row 계산
        int startRowNo1 = ( (pageNo1-1) * pageSize ) + 1;
        int endRowNo1 = pageNo1 * pageSize; 
        setStartRowNo1( startRowNo1 );
        setEndRowNo1( endRowNo1 );
    }
	private void makePaging2() {
		  
        // 기본 값 설정
        if (this.totalCount2 == 0) return; 
        if (this.pageNo2 == 0) this.setPageNo2(1);   //기본 페이지 번호
        if (this.pageSize == 0) this.setPageSize(6); //기본 페이지 리스트 사이즈
        if (this.pageBlock == 0 ) this.setPageBlock(5); //기본 페이지 네비[블록] 사이즈
        
        //--[첫 페이지], [마지막 페이지] 계산
        int finalPage = (totalCount2 + (pageSize - 1)) / pageSize; // 마지막 페이지
        this.setFirstPageNo(1);   // 첫 번째 페이지 번호
        this.setFinalPageNo(finalPage); // 마지막 페이지 번호
        
        //-- [이전] , [다음] 페이지 계산
        boolean isNowFirst = pageNo2 == 1 ? true : false;    // 시작 페이지 (전체)
        boolean isNowFinal = pageNo2 == finalPage ? true : false;  // 마지막 페이지 (전체)
        if (isNowFirst) {
            this.setPrevPageNo(1); // 이전 페이지 번호
        } else {
            this.setPrevPageNo(((pageNo2 - 1) < 1 ? 1 : (pageNo2 - 1))); // 이전 페이지 번호
        }
        if (isNowFinal) {
            this.setNextPageNo(finalPage); // 다음 페이지 번호
        } else {
            this.setNextPageNo(((pageNo2 + 1) > finalPage ? finalPage : (pageNo2 + 1))); // 다음 페이지 번호
        }
                
        //-- 페이징 네비[블록]을 계산
        int startPage = ((pageNo2 - 1) / pageBlock) * pageBlock + 1; // 시작 페이지 (페이징 네비 기준)
        int endPage = startPage + pageBlock - 1;      // 끝 페이지 (페이징 네비 기준)
        // 페이징 네비가 만약 [20-30] 인데 마지막 페이지가 28 인 경우 
        // [29, 30] 페이지는 페이징 네비에 미노출 해야 한다.
        if (endPage > finalPage) { // [마지막 페이지 (페이징 네비 기준) > 마지막 페이지] 보다 큰 경우 
            endPage = finalPage;  
        }
        this.setStartPageNo(startPage); // 시작 페이지 (페이징 네비 기준)
        this.setEndPageNo(endPage);  // 끝 페이지 (페이징 네비 기준)

        //--조회 시작 row, 조회 마지막 row 계산
        int startRowNo2 = ( (pageNo2-1) * pageSize ) + 1;
        int endRowNo2 = pageNo2 * pageSize; 
        setStartRowNo2( startRowNo2 );
        setEndRowNo2( endRowNo2 );
    }
}  

