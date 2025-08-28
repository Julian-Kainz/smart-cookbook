const cds = require("@sap/cds");

class CookbookService extends cds.ApplicationService {
  init() {
    this.on("addCourse", this.addCourse);
    return super.init();
  }

  addCourse = async function (req) {
    const { courseID, courseName } = req.data;

    if (!courseName) {
      req.error(400, "courseName cannot be null");
      return;
    }

    if (!courseID) {
      req.error(400, "courseID cannot be null");
      return;
    }


    const { Courses } = cds.entities;

    const [existing] = await SELECT.from(Courses).where({ ID: courseID });

    if (existing) {
      req.error(400, `Course with ID ${courseID} already exists`);
      return;
    }

    const result = await INSERT.into("Courses").entries({
      ID: courseID,
      name: courseName,
    });

    return `Course created with Name: ${courseName} and ID: ${courseID}`;
  };
}


module.exports = { CookbookService };
