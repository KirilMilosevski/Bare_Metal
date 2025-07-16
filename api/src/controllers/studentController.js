const { Student } = require('../models');

exports.createStudent = async (req, res) => {
  try {
    const student = await Student.create(req.body);
    res.status(201).json(student);
  } catch (err) {
    console.error(err);
    res.status(400).json({ error: 'Invalid input' });
  }
};

exports.getAllStudents = async (req, res) => {
  const students = await Student.findAll();
  res.json(students);
};

exports.getStudentById = async (req, res) => {
  const student = await Student.findByPk(req.params.id);
  if (student) res.json(student);
  else res.status(404).json({ error: 'Not found' });
};

exports.updateStudent = async (req, res) => {
  const student = await Student.findByPk(req.params.id);
  if (!student) return res.status(404).json({ error: 'Not found' });

  await student.update(req.body);
  res.json(student);
};

exports.deleteStudent = async (req, res) => {
  const student = await Student.findByPk(req.params.id);
  if (!student) return res.status(404).json({ error: 'Not found' });

  await student.destroy();
  res.json({ message: 'Deleted' });
};
