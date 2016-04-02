package gapp.web.controller;

import gapp.model.AdditionalInfo;
import gapp.model.AdditionalInfoRecords;
import gapp.model.Application;
import gapp.model.ApplicationStatusRecords;
import gapp.model.Department;
import gapp.model.DepartmentProgram;
import gapp.model.ListDepartment;
import gapp.model.ProgramTerm;
import gapp.model.Status;
import gapp.model.Student;
import gapp.model.StudentEducationInfo;
import gapp.model.User;
import gapp.model.dao.AdditionalInfoDao;
import gapp.model.dao.AdditionalInfoRecordsDao;
import gapp.model.dao.ApplicationDao;
import gapp.model.dao.ApplicationStatusRecordsDao;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.DepartmentProgramDao;
import gapp.model.dao.ProgramTermDao;
import gapp.model.dao.StatusDao;
import gapp.model.dao.StudentDetailDao;
import gapp.model.dao.StudentEducationalInfoDao;
import gapp.model.dao.UserDao;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class StudentController {

	@Autowired
	ApplicationDao applicationDao;

	@Autowired
	StudentDetailDao studentDetailDao;

	@Autowired
	StudentEducationalInfoDao studentEducationalDao;

	@Autowired
	AdditionalInfoRecordsDao additionalInfoRecordsDao;

	@Autowired
	DepartmentDao departmentDao;

	@Autowired
	DepartmentProgramDao departmentProgramDao;

	@Autowired
	ProgramTermDao programTermDao;

	@Autowired
	AdditionalInfoDao additionalInfoDao;

	@Autowired
	UserDao userDao;

	@Autowired
	StatusDao statusDao;

	@Autowired
	ApplicationStatusRecordsDao applicationStatusRecordsDao;

	@Autowired
	private ServletContext context;

	private static final int BUFFER_SIZE = 4096;
	private String filePath = "/WEB-INF/files/";

	private static final ObjectMapper objectMapper = new ObjectMapper();

	private File getFileDirectory() {
		String path = context.getRealPath("/WEB-INF/files");
		return new File(path);
	}

	@RequestMapping(value = "/user/student.html", method = RequestMethod.GET)
	public String StudentView(ModelMap models, HttpServletRequest request) {

		return "/user/student";

	}

	@RequestMapping(value = "/student/viewStudentApplication.html", method = RequestMethod.GET)
	public String ViewStudentApplication(ModelMap models,
			HttpServletRequest request) {

		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userId").toString();
		models.put("application", applicationDao
				.getAllApplicationOfStudent(Integer.parseInt(uid)));
		return "student/viewStudentApplication";

	}

	@RequestMapping(value = "/student/viewStudentApplicationDetails.html", method = RequestMethod.GET)
	public String ViewStudentApplicationDetail(ModelMap models,
			HttpServletRequest request, @RequestParam Integer Id) {

		models.put("additionalValue",
				additionalInfoRecordsDao.getAdditionalInfoRecords(Id));
		models.put("studentEducational",
				studentEducationalDao.getStudentEducationalInfo(Id));
		models.put("studentDetail", studentDetailDao.getStudentDetail(Id));
		models.put("application", applicationDao.getApplicationDetail(Id));
		return "student/viewStudentApplicationDetail";
	}

	@RequestMapping(value = "/student/addStudentApplication.html", method = RequestMethod.GET)
	public String AddStudentApplication(ModelMap models,
			HttpServletRequest request) {

		models.put("dept", departmentDao.getDepartments());
		models.put("programTerm", programTermDao.getProgramTerm());
		models.put("showDetail", 0);

		return "student/addStudentApplication";
	}

	@RequestMapping(value = "/student/addStudentApplication.html", method = RequestMethod.POST)
	public String addStudentApplication(ModelMap models,
			HttpServletRequest request, @RequestParam MultipartFile transcript,
			@RequestParam("file") MultipartFile[] files)
			throws IllegalStateException, IOException {
		/* int formId = Integer.parseInt(request.getParameter("formId")); */
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userId").toString();

		/* if (formId == 0) { */
		int deptId = Integer.parseInt(request.getParameter("deptId"));
		int programId = Integer.parseInt(request.getParameter("deptProgram"));
		int termId = Integer.parseInt(request.getParameter("programTerm"));
		String gpa = request.getParameter("gpa");
		String international = request.getParameter("IsInternationalStudent");
		boolean IsInternationalStudent = false;
		if (international != null) {
			IsInternationalStudent = true;
		}
		String toefl = "-1";
		toefl = request.getParameter("toefl");
		// System.out.println(toefl);
		String filename = "";

		if (transcript.getOriginalFilename() != null) {
			SimpleDateFormat format = new SimpleDateFormat(
					"MM_dd_yyyy_HH_mm_ss_S");
			String[] transcriptFile = transcript.getOriginalFilename().split(
					"[.]");
			filename = transcriptFile[0] + "_" + format.format(new Date())
					+ "." + transcriptFile[1];

			transcript.transferTo(new File(getFileDirectory(), filename));
		}

		DepartmentProgram dp = departmentProgramDao.getDeptProgram(programId);
		ProgramTerm pt = programTermDao.getProgramTerm(termId);
		User u = userDao.getUser(Integer.parseInt(uid));
		Status s = statusDao.getStatus(1);

		Application appDetail = new Application();
		appDetail.setProgram(dp);
		appDetail.setTerm(pt);
		appDetail.setUser(u);
		appDetail.setStatus(s);
		appDetail.setInternational(IsInternationalStudent);
		if (toefl != "0") {
			appDetail.setToefl(Integer.parseInt(toefl));
		}
		appDetail.setGPA(Double.parseDouble(gpa));
		appDetail.setTranscript(filename);
		appDetail.setSubmit(false);
		appDetail.setCreatedOn(new Date());
		appDetail.setEnabled(true);

		Application app = applicationDao.saveApplication(appDetail);
		int appId = app.getApplicationId();

		// models.put("showDetail", 1);
		List<AdditionalInfo> addInfo = (List<AdditionalInfo>) additionalInfoDao
				.getAdditionalInfoByDeptId(deptId);
		int fileCount = 0;
		for (AdditionalInfo row : addInfo) {
			AdditionalInfoRecords air = new AdditionalInfoRecords();
			AdditionalInfo ai = additionalInfoDao.getAdditionalInfo(row
					.getAdditionalInfoId());
			air.setAdditionalInfo(ai);
			air.setEnabled(true);
			air.setUser(u);
			air.setApplication(app);
			if (row.getFieldType().equals("Text")) {
				air.setValue(request.getParameter(row.getName()));
			} else if (row.getFieldType().equals("Number")) {
				air.setValue(request.getParameter(row.getName()));
			} else {
				String fileName = "";
				 System.out.println(files.length);
				if (files != null && files.length > 0) {
					for (int i = 0; i < files.length; i++) {
						try {
							if (fileCount == i) {
								 System.out.println(fileCount);
								if (files[i].getOriginalFilename() != null && files[i].getOriginalFilename() != "") {
									
									fileName = files[i].getOriginalFilename();
									System.out.println(fileName);
									SimpleDateFormat format = new SimpleDateFormat(
											"MM_dd_yyyy_HH_mm_ss_S");
									String[] transcriptFile = files[i]
											.getOriginalFilename().split("[.]");
									fileName = transcriptFile[0] + "_"
											+ format.format(new Date()) + "."
											+ transcriptFile[1];

									files[i].transferTo(new File(
											getFileDirectory(), fileName));
									air.setValue(fileName);
								}
								else{
									air.setValue(fileName);
								}
							}

							//System.out.println(fileName);
						} catch (Exception e) {
							return "You failed to upload " + fileName + ": "
									+ e.getMessage() + "<br/>";
						}
					}
					fileCount++;
				}
			}

			additionalInfoRecordsDao.saveAdditionalInfoRecords(air);
		}

		return "redirect:/student/addStudentDetail.html?app=" + appId;
	}

	@RequestMapping(value = "/student/addStudentDetail.html", method = RequestMethod.POST)
	public String addStudentDetail(ModelMap models, HttpServletRequest request) {

		// models.put("dept", departmentDao.getDepartments());
		// models.put("programTerm", programTermDao.getProgramTerm());
		// models.put("showDetail", 2);

		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userId").toString();
		int applicationID = Integer.parseInt(request.getParameter("appStID"));
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String emailId = request.getParameter("emailId");
		String cin = request.getParameter("cin");
		String phno = request.getParameter("phoneNo");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String citizenship = request.getParameter("citizenship");
		DateFormat dt1 = new SimpleDateFormat("MM/dd/yyyy");
		Date date = new Date();
		try {
			date = dt1.parse(dob);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		User u = userDao.getUser(Integer.parseInt(uid));
		Application app = applicationDao.getApplication(applicationID);

		Student sd = new Student();
		sd.setUser(u);
		sd.setApplication(app);
		sd.setFirst_name(fname);
		sd.setLast_name(lname);
		sd.setEmailId(emailId);
		sd.setCitizenship(citizenship);
		sd.setDOB(date);
		sd.setGender(gender);
		sd.setPhoneNumber(phno);
		sd.setStudentCIN(cin);
		sd.setEnabled(true);

		Student st = studentDetailDao.saveStudentDetail(sd);

		return "redirect:/student/addStudentEducation.html?app="
				+ applicationID;
	}

	@RequestMapping(value = "/student/addStudentDetail.html", method = RequestMethod.GET)
	public String addStudentDetail(ModelMap models, @RequestParam Integer app) {

		// models.put("dept", departmentDao.getDepartments());
		// models.put("programTerm", programTermDao.getProgramTerm());

		models.put("showDetail", 1);
		models.put("applicationId", app);

		return "student/addStudentApplication";
	}

	@RequestMapping(value = "/student/addStudentEducation.html", method = RequestMethod.POST)
	public String addStudentEducation(ModelMap models,
			HttpServletRequest request) {
		int applicationID = Integer.parseInt(request.getParameter("appEdId"));
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userId").toString();
		// models.put("dept", departmentDao.getDepartments());
		// models.put("programTerm", programTermDao.getProgramTerm());
		String btn = request.getParameter("buttonClicked");
		if (btn.equals("add")) {
			String clgName = request.getParameter("collegeName");
			String duration = request.getParameter("duration");
			String degree = request.getParameter("degree");
			String major = request.getParameter("major");
			User u = userDao.getUser(Integer.parseInt(uid));
			Application app = applicationDao.getApplication(applicationID);
			models.put("showDetail", 2);
			if (clgName != "" && duration != "" && degree != "" && major != "") {
				StudentEducationInfo stEdu = new StudentEducationInfo();
				stEdu.setCollegeName(clgName);
				stEdu.setTimePeriod(duration);
				stEdu.setDegreeEarned(degree);
				stEdu.setMajor(major);
				stEdu.setApplication(app);
				stEdu.setUser(u);
				stEdu.setEnabled(true);
				studentEducationalDao.saveStudentEducationInfo(stEdu);
				models.put("EducationRecords", studentEducationalDao
						.getStudentEducationalInfo(applicationID));
				models.put("EduAppId", applicationID);
				return "student/addStudentApplication";
			} else {
				models.put("ShowAllField", 1);
				models.put("EduAppId", applicationID);
				models.put("EducationRecords", studentEducationalDao
						.getStudentEducationalInfo(applicationID));
				return "student/addStudentApplication";
			}

		} else if (btn.equals("save")) {
			List<StudentEducationInfo> sei = studentEducationalDao
					.getStudentEducationalInfo(applicationID);
			if (sei.size() > 0) {
				// models.put("EducationRecords",
				// studentEducationalDao.getStudentEducationalInfo(applicationID));
				applicationDao.UpdateApplication(applicationID, false);
				models.put("showDetail", 2);
				models.put("modelShowSave", 1);
				models.put("EduAppId", applicationID);
				return "student/addStudentApplication";
			} else {
				models.put("showDetail", 2);
				models.put("showError", 1);
				models.put("EduAppId", applicationID);
				return "student/addStudentApplication";
			}

		} else {
			List<StudentEducationInfo> sei = studentEducationalDao
					.getStudentEducationalInfo(applicationID);
			if (sei.size() > 0) {
				applicationDao.UpdateApplication(applicationID, true);
				Application app = applicationDao.getApplication(applicationID);
				Status st = statusDao.getStatus(1);
				User u = userDao.getUser(Integer.parseInt(uid));
				ApplicationStatusRecords asr = new ApplicationStatusRecords();
				asr.setApplication(app);
				asr.setComments("New Application");
				asr.setCreatedOn(new Date());
				asr.setEnabled(true);
				asr.setTime(new Date());
				asr.setStaff(u);
				asr.setStatus(st);
				applicationStatusRecordsDao.saveApplicationStatusRecords(asr);
				models.put("modelShowSubmit", 1);
				models.put("showDetail", 2);
				models.put("EduAppId", applicationID);
				return "student/addStudentApplication";
			} else {
				models.put("showDetail", 2);
				models.put("showError", 1);
				models.put("EduAppId", applicationID);
				return "student/addStudentApplication";
			}
		}
	}

	@RequestMapping(value = "/student/addStudentEducation.html", method = RequestMethod.GET)
	public String AddStudentEducation(ModelMap models,
			HttpServletRequest request) {
		String app = request.getParameter("app");
		models.put("showDetail", 2);
		models.put("EduAppId", app);
		return "student/addStudentApplication";

	}

	@RequestMapping(value = "/student/getStudentProgram.html", method = RequestMethod.POST)
	public @ResponseBody String getDepartmentProgram(
			@RequestParam(value = "deptId") Integer deptId, ModelMap models,
			HttpServletResponse response) throws JsonGenerationException,
			JsonMappingException, IOException {

		@SuppressWarnings("unchecked")
		List<DepartmentProgram> dp = (List<DepartmentProgram>) departmentProgramDao
				.getDeptProgramByAjax(deptId);

		response.setContentType("application/json");
		objectMapper.writeValue(response.getWriter(), dp);

		return null;
		// return dp;
		// return result;
	}

	@RequestMapping(value = "/student/getAdditionalInfoByDept.html", method = RequestMethod.POST)
	public @ResponseBody String getAdditionalInfoByDept(
			@RequestParam(value = "deptId") Integer deptId, ModelMap models,
			HttpServletResponse response) throws JsonGenerationException,
			JsonMappingException, IOException {

		@SuppressWarnings("unchecked")
		List<AdditionalInfo> addInfo = (List<AdditionalInfo>) additionalInfoDao
				.getAdditionalInfoByAjax(deptId);

		response.setContentType("application/json");
		objectMapper.writeValue(response.getWriter(), addInfo);

		return null;
		// return dp;
		// return result;
	}

	@RequestMapping(value = "/student/getAdditionalInfoRecordsByDept.html", method = RequestMethod.POST)
	public @ResponseBody String getAdditionalInfoRecordsByDept(
			@RequestParam(value = "applicationId") Integer applicationId,
			ModelMap models, HttpServletResponse response)
			throws JsonGenerationException, JsonMappingException, IOException {

		@SuppressWarnings("unchecked")
		List<AdditionalInfoRecords> addInfoValue = (List<AdditionalInfoRecords>) additionalInfoRecordsDao
				.getAdditionalInfoRecordsByAjax(applicationId);

		response.setContentType("application/json");
		objectMapper.writeValue(response.getWriter(), addInfoValue);

		return null;
		// return dp;
		// return result;
	}

	@RequestMapping(value = "/student/fileDownload.html", method = RequestMethod.GET)
	public String doDownload(HttpServletRequest request,
			HttpServletResponse response, @RequestParam String file)
			throws IOException {

		// get absolute path of the application
		ServletContext context = request.getServletContext();
		String appPath = context.getRealPath(filePath);
		System.out.println("appPath = " + appPath);

		// construct the complete absolute path of the file
		// String fullPath = appPath + filePath;
		String fullPath = appPath + "/" + file;
		File downloadFile = new File(fullPath);
		FileInputStream inputStream = new FileInputStream(downloadFile);

		// get MIME type of the file
		String mimeType = context.getMimeType(fullPath);
		if (mimeType == null) {
			// set to binary type if MIME mapping not found
			mimeType = "application/octet-stream";
		}
		System.out.println("MIME type: " + mimeType);

		// set content attributes for the response
		response.setContentType(mimeType);
		response.setContentLength((int) downloadFile.length());

		// set headers for the response
		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment; filename=\"%s\"",
				downloadFile.getName());
		response.setHeader(headerKey, headerValue);

		// get output stream of the response
		OutputStream outStream = response.getOutputStream();

		byte[] buffer = new byte[BUFFER_SIZE];
		int bytesRead = -1;

		// write bytes read from the input stream into the output stream
		while ((bytesRead = inputStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, bytesRead);
		}

		inputStream.close();
		outStream.close();

		return "/student/fileDownload.html";

	}

	@RequestMapping(value = "/student/editStudentApplication.html", method = RequestMethod.GET)
	public String EditStudentApplication(ModelMap models,
			HttpServletRequest request, @RequestParam Integer appId) {

		Application application = applicationDao.getApplication(appId);
		models.put("selectedDept", application.getProgram().getDept()
				.getDepartmentId());
		models.put("Application", application);
		models.put("dept", departmentDao.getDepartments());
		models.put("programTerm", programTermDao.getProgramTerm());
		models.put("showDetail", 0);

		return "student/editStudentApplication";
	}

	@RequestMapping(value = "/student/editStudentApplication.html", method = RequestMethod.POST)
	public String editStudentApplication(ModelMap models,
			HttpServletRequest request, @RequestParam MultipartFile transcript,
			@RequestParam("file") MultipartFile[] files)
			throws IllegalStateException, IOException {

		/* int formId = Integer.parseInt(request.getParameter("formId")); */
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userId").toString();

		int applicationId = Integer.parseInt(request
				.getParameter("ApplicationID"));
		int deptId = Integer.parseInt(request.getParameter("deptId"));
		int programId = Integer.parseInt(request.getParameter("deptProgram"));
		int termId = Integer.parseInt(request.getParameter("programTerm"));
		String gpa = request.getParameter("gpa");
		String international = request.getParameter("IsInternationalStudent");
		String existingFile = request.getParameter("hdnTranscriptFile");
		boolean IsInternationalStudent = false;
		if (international != null) {
			IsInternationalStudent = true;
		}
		String toefl = "-1";
		toefl = request.getParameter("toefl");
		// / System.out.println(toefl);

		SimpleDateFormat format = new SimpleDateFormat("MM_dd_yyyy_HH_mm_ss_S");
		String filename = "";
		if (transcript.getOriginalFilename() != "") {
			String[] transcriptFile = transcript.getOriginalFilename().split(
					"[.]");
			filename = transcriptFile[0] + "_" + format.format(new Date())
					+ "." + transcriptFile[1];

			transcript.transferTo(new File(getFileDirectory(), filename));
		} else {

			filename = existingFile;
		}

		DepartmentProgram dp = departmentProgramDao.getDeptProgram(programId);
		ProgramTerm pt = programTermDao.getProgramTerm(termId);
		User u = userDao.getUser(Integer.parseInt(uid));
		Status s = statusDao.getStatus(1);

		Application appDetail = new Application();
		appDetail.setApplicationId(applicationId);
		appDetail.setProgram(dp);
		appDetail.setTerm(pt);
		appDetail.setUser(u);
		appDetail.setStatus(s);
		appDetail.setInternational(IsInternationalStudent);
		if (toefl != "0") {
			appDetail.setToefl(Integer.parseInt(toefl));
		}
		appDetail.setGPA(Double.parseDouble(gpa));
		appDetail.setTranscript(filename);
		appDetail.setSubmit(false);
		appDetail.setCreatedOn(new Date());
		appDetail.setEnabled(true);

		Application app = applicationDao.saveApplication(appDetail);
		int appId = app.getApplicationId();

		// models.put("showDetail", 1);
		List<AdditionalInfo> addInfo = (List<AdditionalInfo>) additionalInfoDao
				.getAdditionalInfoByDeptId(deptId);
		int fileCount = 0;
		for (AdditionalInfo row : addInfo) {
			AdditionalInfoRecords air = new AdditionalInfoRecords();
			AdditionalInfo ai = additionalInfoDao.getAdditionalInfo(row
					.getAdditionalInfoId());
			air.setAdditionalInfo(ai);
			air.setEnabled(true);
			air.setUser(u);
			air.setApplication(app);
			if (row.getFieldType().equals("Text")) {
				if(request.getParameter("hdn" + row.getName()) != null){
				air.setValue(request.getParameter(row.getName()));
				
				
				air.setAdditionalInfoRecordsId(Integer.parseInt(request
						.getParameter("hdn" + row.getName())));
				}
				else{
					air.setValue(request.getParameter(row.getName()));	
				}
			} else if (row.getFieldType().equals("Number")) {
				if(request.getParameter("hdn" + row.getName()) != null){
				air.setValue(request.getParameter(row.getName()));
				//air.setValue(request.getParameter(row.getName()));
				
				air.setAdditionalInfoRecordsId(Integer.parseInt(request
						.getParameter("hdn" + row.getName())));
				}
				else{
					air.setValue(request.getParameter(row.getName()));
				}
			} else {
				String fileName = "";

				if (files != null && files.length > 0) {
				//	System.out.println(files.length);
					for (int i = 0; i < files.length; i++) {
						try {
							if (fileCount == i) {
								if (files[i].getOriginalFilename() != "" && files[i].getOriginalFilename() != null) {
									fileName = files[i].getOriginalFilename();
									//System.out.println(fileName);
									String[] transcriptFile = files[i]
											.getOriginalFilename().split("[.]");
									fileName = transcriptFile[0] + "_"
											+ format.format(new Date()) + "."
											+ transcriptFile[1];

									files[i].transferTo(new File(
											getFileDirectory(), fileName));
									air.setValue(fileName);
									if(request.getParameter("hdn"+ row.getName()) != null){
									air.setAdditionalInfoRecordsId(Integer
											.parseInt(request
													.getParameter("hdn"
															+ row.getName())));
									}
								} else {
									if(request.getParameter("hdn" + row.getName()) != null){
									air.setValue(request.getParameter(row
											.getName()));
									air.setAdditionalInfoRecordsId(Integer
											.parseInt(request
													.getParameter("hdn"
															+ row.getName())));
									}
									else{
										if (files[i].getOriginalFilename() != "" && files[i].getOriginalFilename() != null) {
											fileName = files[i].getOriginalFilename();
											System.out.println(fileName);
											String[] transcriptFile = files[i]
													.getOriginalFilename().split("[.]");
											fileName = transcriptFile[0] + "_"
													+ format.format(new Date()) + "."
													+ transcriptFile[1];

											files[i].transferTo(new File(
													getFileDirectory(), fileName));
											air.setValue(fileName);
										}else{
											air.setValue(fileName);
										}
									}
								}
							}
						} catch (Exception e) {
							return "You failed to upload " + fileName + ": "
									+ e.getMessage() + "<br/>";
						}
					}
					fileCount++;
				}
			}

			additionalInfoRecordsDao.saveAdditionalInfoRecords(air);
		}

		return "redirect:/student/editStudentDetail.html?app=" + appId;

	}

	@RequestMapping(value = "/student/editStudentDetail.html", method = RequestMethod.GET)
	public String editStudentDetail(ModelMap models, @RequestParam Integer app) {

		// models.put("dept", departmentDao.getDepartments());
		// models.put("programTerm", programTermDao.getProgramTerm());

		models.put("showDetail", 1);
		models.put("applicationId", app);
		models.put("StudentDetail", studentDetailDao.getStudentDetail(app));

		return "student/editStudentApplication";
	}

	@RequestMapping(value = "/student/editStudentDetail.html", method = RequestMethod.POST)
	public String EditStudentDetail(ModelMap models, HttpServletRequest request) {

		// models.put("dept", departmentDao.getDepartments());
		// models.put("programTerm", programTermDao.getProgramTerm());
		// models.put("showDetail", 2);

		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userId").toString();
		int applicationID = Integer.parseInt(request.getParameter("appStID"));
		int stdID = Integer.parseInt(request.getParameter("hdnStudentId"));
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String emailId = request.getParameter("emailId");
		String cin = request.getParameter("cin");
		String phno = request.getParameter("phoneNo");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String citizenship = request.getParameter("citizenship");
		DateFormat dt1 = new SimpleDateFormat("MM/dd/yyyy");
		Date date = new Date();
		try {
			date = dt1.parse(dob);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		User u = userDao.getUser(Integer.parseInt(uid));
		Application app = applicationDao.getApplication(applicationID);

		Student sd = new Student();
		sd.setStudentId(stdID);
		sd.setUser(u);
		sd.setApplication(app);
		sd.setFirst_name(fname);
		sd.setLast_name(lname);
		sd.setEmailId(emailId);
		sd.setCitizenship(citizenship);
		sd.setDOB(date);
		sd.setGender(gender);
		sd.setPhoneNumber(phno);
		sd.setStudentCIN(cin);
		sd.setEnabled(true);

		Student st = studentDetailDao.saveStudentDetail(sd);

		return "redirect:/student/editStudentEducation.html?app="
				+ applicationID;
	}

	@RequestMapping(value = "/student/editStudentEducation.html", method = RequestMethod.GET)
	public String EditStudentEducation(ModelMap models,
			HttpServletRequest request) {
		String app = request.getParameter("app");
		models.put("showDetail", 2);
		models.put("EduAppId", app);
		models.put("showEduRecords", studentEducationalDao
				.getStudentEducationalInfo(Integer.parseInt(app)));
		return "student/editStudentApplication";

	}

	@RequestMapping(value = "/student/editStudentEducation.html", method = RequestMethod.POST)
	public String editStudentEducation(ModelMap models,
			HttpServletRequest request) {
		int applicationID = Integer.parseInt(request.getParameter("appEdId"));
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userId").toString();
		// models.put("dept", departmentDao.getDepartments());
		// models.put("programTerm", programTermDao.getProgramTerm());
		String btn = request.getParameter("buttonClicked");
		if (btn.equals("add")) {
			String clgName = request.getParameter("collegeName");
			String duration = request.getParameter("duration");
			String degree = request.getParameter("degree");
			String major = request.getParameter("major");
			User u = userDao.getUser(Integer.parseInt(uid));
			Application app = applicationDao.getApplication(applicationID);
			models.put("showDetail", 2);
			if (clgName != "" && duration != "" && degree != "" && major != "") {
				StudentEducationInfo stEdu = new StudentEducationInfo();
				stEdu.setCollegeName(clgName);
				stEdu.setTimePeriod(duration);
				stEdu.setDegreeEarned(degree);
				stEdu.setMajor(major);
				stEdu.setApplication(app);
				stEdu.setUser(u);
				stEdu.setEnabled(true);
				studentEducationalDao.saveStudentEducationInfo(stEdu);
				models.put("showEduRecords", studentEducationalDao
						.getStudentEducationalInfo(applicationID));
				models.put("EduAppId", applicationID);
				return "student/editStudentApplication";
			} else {
				models.put("ShowAllField", 1);
				models.put("EduAppId", applicationID);
				models.put("showEduRecords", studentEducationalDao
						.getStudentEducationalInfo(applicationID));
				return "student/editStudentApplication";
			}

		} else if (btn.equals("save")) {
			List<StudentEducationInfo> sei = studentEducationalDao
					.getStudentEducationalInfo(applicationID);
			if (sei.size() > 0) {
				// models.put("EducationRecords",
				// studentEducationalDao.getStudentEducationalInfo(applicationID));
				applicationDao.UpdateApplication(applicationID, false);
				models.put("showDetail", 2);
				models.put("modelShowSave", 1);
				models.put("EduAppId", applicationID);
				return "student/editStudentApplication";
			} else {
				models.put("showDetail", 2);
				models.put("showError", 1);
				models.put("EduAppId", applicationID);
				return "student/editStudentApplication";
			}

		} else {
			List<StudentEducationInfo> sei = studentEducationalDao
					.getStudentEducationalInfo(applicationID);
			if (sei.size() > 0) {
				applicationDao.UpdateApplication(applicationID, true);
				Application app = applicationDao.getApplication(applicationID);
				Status st = statusDao.getStatus(1);
				User u = userDao.getUser(Integer.parseInt(uid));
				ApplicationStatusRecords asr = new ApplicationStatusRecords();
				asr.setApplication(app);
				asr.setComments("New Application");
				asr.setCreatedOn(new Date());
				asr.setEnabled(true);
				asr.setTime(new Date());
				asr.setStaff(u);
				asr.setStatus(st);
				applicationStatusRecordsDao.saveApplicationStatusRecords(asr);
				models.put("modelShowSubmit", 1);
				models.put("showDetail", 2);
				models.put("EduAppId", applicationID);
				return "student/editStudentApplication";
			} else {
				models.put("showDetail", 2);
				models.put("showError", 1);
				models.put("EduAppId", applicationID);
				return "student/editStudentApplication";
			}
		}
	}

	@RequestMapping(value = "/student/deleteStudentEducation.html", method = RequestMethod.GET)
	public String removeStudentEducation(ModelMap models,
			HttpServletRequest request) {
		int stEduId = Integer.parseInt(request.getParameter("ID"));
		int ApplicationId = Integer.parseInt(request.getParameter("App"));
		studentEducationalDao.removeStudentEducation(stEduId);
		// models.put("deptProgram",
		// departmentProgramDao.searchDepartmentProgramByDept(deptId));
		return "redirect:/student/editStudentEducation.html?app="
				+ ApplicationId;

	}
}
