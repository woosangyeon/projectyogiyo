package auth.service;

import auth.dao.MboardDAO;
import mBoard.model.MBoard;

public class MboardService {
	
	private static MboardService service = new MboardService();
	public MboardDAO dao = MboardDAO.getInstance();
	private MboardService() {}
	
	public static MboardService getInstance() {
		return service;
	}
	
	public void MboardInsert(MBoard mboard) {
		 dao.MboardInsert(mboard);
	}

}
