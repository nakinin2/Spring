package je.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import je.dao.BoardDao;
import je.model.Board;
import je.model.BoardFile;
import je.model.BoardReply;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao bd;
	
	public List<Board> list(Board board) {
		return bd.list(board);		
	}

	public int getTotal(Board board) {
		return bd.getTotal(board);
	}	

	public void boardHit(int brd_no) {
		bd.boardHit(brd_no);
	}

	public Board boardSelect(int brd_no) {
		return bd.boardSelect(brd_no);
	}

	public int insertNo() {
		return bd.insertNo();
	}

	public int boardInsert(Board board) {
		return bd.boardInsert(board);
	}

	public void updateRe_step(Board board) {
		bd.updateRe_step(board);
	}

	public int boardUpdate(Board board) {
		return bd.boardUpdate(board);
	}

	public Board deletePwdChk(int number) {
		return bd.deletePwdChk(number);
	}

	public int boardDelete(int number) {
		return bd.boardDelete(number);
	}
	
	public List<BoardReply> selectReply(int brd_no) {
		return bd.selectReply(brd_no);
	}
	
	public int replyNo() {
		return bd.replyNo();
	}

	public int insertReply(BoardReply boardReply) {
		return bd.insertReply(boardReply);
	}

	public int replyCount(int brd_no) {
		return bd.replyCount(brd_no);
	}

	public int updateReply(BoardReply boardReply) {
		return bd.updateReply(boardReply);
	}

	
	public int deleteReply(int crNo) {
		return bd.deleteReply(crNo);
	}
	
	/*public BoardReply replyOne(int cr_no) {
		return bd.replyOne(cr_no);
	}*/
	
	public int refTotal(int brd_no) {
		return bd.refTotal(brd_no);
	}
	
	public Date newday() {
		return bd.newday();
	}

	public int refLimit(int ref) {
		return bd.refLimit(ref);
	}

	public int fileNo() {
		return bd.fileNo();
	}
	
	public int fileInsert(BoardFile boardfile) {
		return bd.fileInsert(boardfile);
	}

	public List<BoardFile> selectFile(int brd_no) {
		return bd.selectFile(brd_no);
	}

	public int fileCount(int brd_no) {
		return bd.fileCount(brd_no);
	}

	public void fileDelete(BoardFile boardfile) {
		bd.fileDelete(boardfile);
	}

	public String fileSelect(BoardFile boardfile) {
		return bd.fileSelect(boardfile);
	}

}
