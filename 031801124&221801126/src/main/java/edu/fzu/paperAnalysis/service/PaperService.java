package edu.fzu.paperAnalysis.service;

import edu.fzu.paperAnalysis.vo.Paper;

import java.sql.SQLException;
import java.util.List;

public interface PaperService {
    List<Paper> queryPaperByTitle(String title) throws SQLException;
    List<Paper> queryAll() throws SQLException;
    int queryNumber() throws SQLException;
}