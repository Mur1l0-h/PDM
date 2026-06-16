import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryText = Color(0xff1f2937);
    const mutedText = Color(0xff6b7280);
    return MaterialApp(
      title: 'SENAI Stock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Figtree',
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryText,
          brightness: Brightness.light,
          primary: const Color(0xff111827),
          secondary: mutedText,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xfff3f4f6),
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: primaryText,
          displayColor: primaryText,
          fontFamily: 'Figtree',
        ),
        dividerTheme: const DividerThemeData(
          color: Color(0xffe5e7eb),
          thickness: 1,
        ),
        cardTheme: const CardThemeData(
          color: Colors.white,
          elevation: 1,
          shadowColor: Color(0x14000000),
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            side: BorderSide(color: Color(0xfff3f4f6)),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: Color(0xffd1d5db)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: Color(0xffd1d5db)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: Color(0xff6366f1), width: 1.5),
          ),
          labelStyle: TextStyle(color: mutedText),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xff111827),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: primaryText,
            side: const BorderSide(color: Color(0xffd1d5db)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: primaryText,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        useMaterial3: true,
      ),
      home: const SenaiStockHome(),
    );
  }
}

class Book {
  Book({
    required this.id,
    required this.isbn,
    required this.title,
    required this.category,
  });

  final int id;
  String isbn;
  String title;
  String category;
}

class StockEntry {
  StockEntry({required this.id, required this.bookId, required this.quantity});

  final int id;
  int bookId;
  int quantity;
}

class SchoolClass {
  SchoolClass({required this.id, required this.name, required this.course});

  final int id;
  String name;
  String course;
}

class Role {
  Role({required this.id, required this.name});

  final int id;
  String name;
}

class Employee {
  Employee({
    required this.id,
    required this.nif,
    required this.name,
    required this.cpf,
    required this.roleId,
  });

  final int id;
  String nif;
  String name;
  String cpf;
  int roleId;
}

class Requisition {
  Requisition({
    required this.id,
    required this.date,
    required this.bookId,
    required this.classId,
    required this.employeeId,
    required this.quantity,
  });

  final int id;
  DateTime date;
  int bookId;
  int classId;
  int employeeId;
  int quantity;
}

class SenaiStockHome extends StatefulWidget {
  const SenaiStockHome({super.key});

  @override
  State<SenaiStockHome> createState() => _SenaiStockHomeState();
}

class _SenaiStockHomeState extends State<SenaiStockHome> {
  int _selectedIndex = 0;
  int _nextBookId = 4;
  int _nextStockId = 4;
  int _nextClassId = 4;
  int _nextRoleId = 4;
  int _nextEmployeeId = 4;
  int _nextRequisitionId = 3;

  final List<Book> _books = [
    Book(
      id: 1,
      isbn: '9788535902778',
      title: 'Dom Casmurro',
      category: 'Literatura',
    ),
    Book(
      id: 2,
      isbn: '9788572326972',
      title: 'O Cortico',
      category: 'Literatura',
    ),
    Book(
      id: 3,
      isbn: '9788576082675',
      title: 'Logica de Programacao',
      category: 'Tecnologia',
    ),
  ];

  final List<StockEntry> _stock = [
    StockEntry(id: 1, bookId: 1, quantity: 18),
    StockEntry(id: 2, bookId: 2, quantity: 9),
    StockEntry(id: 3, bookId: 3, quantity: 24),
  ];

  final List<SchoolClass> _classes = [
    SchoolClass(id: 1, name: '2DS', course: 'Desenvolvimento de Sistemas'),
    SchoolClass(id: 2, name: '1LOG', course: 'Logistica'),
    SchoolClass(id: 3, name: '3MEC', course: 'Mecanica'),
  ];

  final List<Role> _roles = [
    Role(id: 1, name: 'Bibliotecario'),
    Role(id: 2, name: 'Professor'),
    Role(id: 3, name: 'Coordenador'),
  ];

  final List<Employee> _employees = [
    Employee(
      id: 1,
      nif: '1001',
      name: 'Ana Souza',
      cpf: '111.222.333-44',
      roleId: 1,
    ),
    Employee(
      id: 2,
      nif: '1002',
      name: 'Bruno Lima',
      cpf: '222.333.444-55',
      roleId: 2,
    ),
    Employee(
      id: 3,
      nif: '1003',
      name: 'Carla Dias',
      cpf: '333.444.555-66',
      roleId: 3,
    ),
  ];

  final List<Requisition> _requisitions = [
    Requisition(
      id: 1,
      date: DateTime(2026, 6, 10),
      bookId: 1,
      classId: 1,
      employeeId: 1,
      quantity: 2,
    ),
    Requisition(
      id: 2,
      date: DateTime(2026, 6, 12),
      bookId: 3,
      classId: 2,
      employeeId: 2,
      quantity: 4,
    ),
  ];

  List<_Destination> get _destinations => const [
    _Destination('Dashboard', Icons.dashboard_outlined),
    _Destination('Livros', Icons.menu_book_outlined),
    _Destination('Estoque', Icons.inventory_2_outlined),
    _Destination('Requisicoes', Icons.assignment_outlined),
    _Destination('Turmas', Icons.groups_outlined),
    _Destination('Equipe', Icons.badge_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      _DashboardPage(
        totalBooks: _books.length,
        totalStock: _stock.fold<int>(0, (sum, item) => sum + item.quantity),
        totalRequisitions: _requisitions.length,
        lowStock: _stock.where((item) => item.quantity <= 10).length,
        recentRequisitions: _requisitions.reversed.take(4).toList(),
        bookName: _bookName,
        className: _className,
      ),
      _BooksPage(books: _books, onSave: _saveBook, onDelete: _deleteBook),
      _StockPage(
        stock: _stock,
        books: _books,
        bookName: _bookName,
        onSave: _saveStock,
        onDelete: _deleteStock,
      ),
      _RequisitionsPage(
        requisitions: _requisitions,
        books: _books,
        classes: _classes,
        employees: _employees,
        bookName: _bookName,
        className: _className,
        employeeName: _employeeName,
        onSave: _saveRequisition,
        onDelete: _deleteRequisition,
      ),
      _ClassesPage(
        classes: _classes,
        onSave: _saveClass,
        onDelete: _deleteClass,
      ),
      _PeoplePage(
        employees: _employees,
        roles: _roles,
        roleName: _roleName,
        onSaveEmployee: _saveEmployee,
        onDeleteEmployee: _deleteEmployee,
        onSaveRole: _saveRole,
        onDeleteRole: _deleteRole,
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          _TopNavigation(
            destinations: _destinations,
            selectedIndex: _selectedIndex,
            onSelected: (index) => setState(() => _selectedIndex = index),
          ),
          Expanded(child: pages[_selectedIndex]),
        ],
      ),
    );
  }

  String _bookName(int id) =>
      _books.where((book) => book.id == id).firstOrNull?.title ??
      'Livro removido';
  String _className(int id) =>
      _classes.where((item) => item.id == id).firstOrNull?.name ??
      'Turma removida';
  String _employeeName(int id) =>
      _employees.where((item) => item.id == id).firstOrNull?.name ??
      'Funcionario removido';
  String _roleName(int id) =>
      _roles.where((item) => item.id == id).firstOrNull?.name ??
      'Cargo removido';

  void _saveBook(Book draft) {
    setState(() {
      if (draft.id == 0) {
        _books.add(
          Book(
            id: _nextBookId++,
            isbn: draft.isbn,
            title: draft.title,
            category: draft.category,
          ),
        );
        return;
      }
      final book = _books.firstWhere((item) => item.id == draft.id);
      book
        ..isbn = draft.isbn
        ..title = draft.title
        ..category = draft.category;
    });
  }

  void _deleteBook(Book book) {
    setState(() {
      _books.removeWhere((item) => item.id == book.id);
      _stock.removeWhere((item) => item.bookId == book.id);
      _requisitions.removeWhere((item) => item.bookId == book.id);
    });
  }

  void _saveStock(StockEntry draft) {
    setState(() {
      if (draft.id == 0) {
        _stock.add(
          StockEntry(
            id: _nextStockId++,
            bookId: draft.bookId,
            quantity: draft.quantity,
          ),
        );
        return;
      }
      final entry = _stock.firstWhere((item) => item.id == draft.id);
      entry
        ..bookId = draft.bookId
        ..quantity = draft.quantity;
    });
  }

  void _deleteStock(StockEntry entry) =>
      setState(() => _stock.removeWhere((item) => item.id == entry.id));

  void _saveClass(SchoolClass draft) {
    setState(() {
      if (draft.id == 0) {
        _classes.add(
          SchoolClass(
            id: _nextClassId++,
            name: draft.name,
            course: draft.course,
          ),
        );
        return;
      }
      final schoolClass = _classes.firstWhere((item) => item.id == draft.id);
      schoolClass
        ..name = draft.name
        ..course = draft.course;
    });
  }

  void _deleteClass(SchoolClass schoolClass) {
    setState(() {
      _classes.removeWhere((item) => item.id == schoolClass.id);
      _requisitions.removeWhere((item) => item.classId == schoolClass.id);
    });
  }

  void _saveRole(Role draft) {
    setState(() {
      if (draft.id == 0) {
        _roles.add(Role(id: _nextRoleId++, name: draft.name));
        return;
      }
      _roles.firstWhere((item) => item.id == draft.id).name = draft.name;
    });
  }

  void _deleteRole(Role role) {
    setState(() {
      _roles.removeWhere((item) => item.id == role.id);
      _employees.removeWhere((item) => item.roleId == role.id);
    });
  }

  void _saveEmployee(Employee draft) {
    setState(() {
      if (draft.id == 0) {
        _employees.add(
          Employee(
            id: _nextEmployeeId++,
            nif: draft.nif,
            name: draft.name,
            cpf: draft.cpf,
            roleId: draft.roleId,
          ),
        );
        return;
      }
      final employee = _employees.firstWhere((item) => item.id == draft.id);
      employee
        ..nif = draft.nif
        ..name = draft.name
        ..cpf = draft.cpf
        ..roleId = draft.roleId;
    });
  }

  void _deleteEmployee(Employee employee) {
    setState(() {
      _employees.removeWhere((item) => item.id == employee.id);
      _requisitions.removeWhere((item) => item.employeeId == employee.id);
    });
  }

  void _saveRequisition(Requisition draft) {
    setState(() {
      if (draft.id == 0) {
        _requisitions.add(
          Requisition(
            id: _nextRequisitionId++,
            date: draft.date,
            bookId: draft.bookId,
            classId: draft.classId,
            employeeId: draft.employeeId,
            quantity: draft.quantity,
          ),
        );
        return;
      }
      final requisition = _requisitions.firstWhere(
        (item) => item.id == draft.id,
      );
      requisition
        ..date = draft.date
        ..bookId = draft.bookId
        ..classId = draft.classId
        ..employeeId = draft.employeeId
        ..quantity = draft.quantity;
    });
  }

  void _deleteRequisition(Requisition requisition) {
    setState(
      () => _requisitions.removeWhere((item) => item.id == requisition.id),
    );
  }
}

class _Destination {
  const _Destination(this.label, this.icon);
  final String label;
  final IconData icon;
}

class _TopNavigation extends StatelessWidget {
  const _TopNavigation({
    required this.destinations,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<_Destination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xfff3f4f6))),
        ),
        child: SafeArea(
          bottom: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: SizedBox(
                height: 64,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const _LaravelLogo(),
                      const SizedBox(width: 36),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: destinations.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 28),
                          itemBuilder: (context, index) => _NavLink(
                            label: destinations[index].label,
                            selected: selectedIndex == index,
                            onTap: () => onSelected(index),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      PopupMenuButton<int>(
                        tooltip: 'Usuario',
                        offset: const Offset(0, 44),
                        itemBuilder: (context) => const [
                          PopupMenuItem(value: 0, child: Text('Profile')),
                          PopupMenuItem(value: 1, child: Text('Log Out')),
                        ],
                        child: const Row(
                          children: [
                            Text(
                              'SENAI User',
                              style: TextStyle(
                                color: Color(0xff6b7280),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 18,
                              color: Color(0xff6b7280),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 64,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: selected ? const Color(0xff6366f1) : Colors.transparent,
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? const Color(0xff111827) : const Color(0xff6b7280),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _LaravelLogo extends StatelessWidget {
  const _LaravelLogo();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(36, 36),
      painter: _LaravelLogoPainter(),
    );
  }
}

class _LaravelLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..color = const Color(0xff111827);

    Path box(double left, double top, double width, double height) {
      final path = Path();
      path.moveTo(left + width / 2, top);
      path.lineTo(left + width, top + height * .25);
      path.lineTo(left + width, top + height * .75);
      path.lineTo(left + width / 2, top + height);
      path.lineTo(left, top + height * .75);
      path.lineTo(left, top + height * .25);
      path.close();
      return path;
    }

    canvas.drawPath(box(3, 8, 12, 14), paint);
    canvas.drawPath(box(20, 3, 12, 14), paint);
    canvas.drawPath(box(20, 20, 12, 14), paint);
    canvas.drawLine(const Offset(15, 15), const Offset(20, 11), paint);
    canvas.drawLine(const Offset(15, 18), const Offset(20, 27), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DashboardPage extends StatelessWidget {
  const _DashboardPage({
    required this.totalBooks,
    required this.totalStock,
    required this.totalRequisitions,
    required this.lowStock,
    required this.recentRequisitions,
    required this.bookName,
    required this.className,
  });

  final int totalBooks;
  final int totalStock;
  final int totalRequisitions;
  final int lowStock;
  final List<Requisition> recentRequisitions;
  final String Function(int id) bookName;
  final String Function(int id) className;

  @override
  Widget build(BuildContext context) {
    return _PageScaffold(
      title: 'Dashboard',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _DashboardGrid(
            children: [
              _MetricCard(
                label: 'Livros',
                value: '$totalBooks',
                icon: Icons.menu_book_outlined,
              ),
              _MetricCard(
                label: 'Exemplares',
                value: '$totalStock',
                icon: Icons.inventory_2_outlined,
              ),
              _MetricCard(
                label: 'Requisicoes',
                value: '$totalRequisitions',
                icon: Icons.assignment_outlined,
              ),
              _MetricCard(
                label: 'Baixo estoque',
                value: '$lowStock',
                icon: Icons.warning_amber_outlined,
              ),
            ],
          ),
          const SizedBox(height: 24),
          const _SectionTitle('Ultimas requisicoes'),
          const SizedBox(height: 8),
          if (recentRequisitions.isEmpty)
            const _EmptyState(message: 'Nenhuma requisicao cadastrada.')
          else
            _LaravelTable(
              children: [
                for (final requisition in recentRequisitions)
                  _ReadOnlyRow(
                    icon: Icons.assignment_outlined,
                    title: bookName(requisition.bookId),
                    subtitle:
                        '${className(requisition.classId)} - ${_formatDate(requisition.date)}',
                    trailing: '${requisition.quantity} un.',
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class _BooksPage extends StatelessWidget {
  const _BooksPage({
    required this.books,
    required this.onSave,
    required this.onDelete,
  });

  final List<Book> books;
  final ValueChanged<Book> onSave;
  final ValueChanged<Book> onDelete;

  @override
  Widget build(BuildContext context) {
    return _ListPage(
      title: 'Livros',
      actionLabel: 'Novo livro',
      onAdd: () => _openBookDialog(context),
      isEmpty: books.isEmpty,
      emptyMessage: 'Cadastre livros para controlar o estoque.',
      children: [
        for (final book in books)
          _RecordCard(
            title: book.title,
            subtitle: '${book.category} - ISBN ${book.isbn}',
            icon: Icons.menu_book_outlined,
            onEdit: () => _openBookDialog(context, book),
            onDelete: () => onDelete(book),
          ),
      ],
    );
  }

  Future<void> _openBookDialog(BuildContext context, [Book? book]) async {
    final isbn = TextEditingController(text: book?.isbn ?? '');
    final title = TextEditingController(text: book?.title ?? '');
    final category = TextEditingController(text: book?.category ?? '');
    final result = await _showEntityDialog<Book>(
      context: context,
      title: book == null ? 'Novo livro' : 'Editar livro',
      fields: [
        TextField(
          controller: title,
          decoration: const InputDecoration(labelText: 'Titulo'),
        ),
        TextField(
          controller: isbn,
          decoration: const InputDecoration(labelText: 'ISBN'),
        ),
        TextField(
          controller: category,
          decoration: const InputDecoration(labelText: 'Categoria'),
        ),
      ],
      buildResult: () => Book(
        id: book?.id ?? 0,
        isbn: isbn.text,
        title: title.text,
        category: category.text,
      ),
    );
    if (result != null) onSave(result);
  }
}

class _StockPage extends StatelessWidget {
  const _StockPage({
    required this.stock,
    required this.books,
    required this.bookName,
    required this.onSave,
    required this.onDelete,
  });

  final List<StockEntry> stock;
  final List<Book> books;
  final String Function(int id) bookName;
  final ValueChanged<StockEntry> onSave;
  final ValueChanged<StockEntry> onDelete;

  @override
  Widget build(BuildContext context) {
    return _ListPage(
      title: 'Estoque',
      actionLabel: 'Nova entrada',
      onAdd: books.isEmpty ? null : () => _openStockDialog(context),
      isEmpty: stock.isEmpty,
      emptyMessage: books.isEmpty
          ? 'Cadastre um livro antes de lançar estoque.'
          : 'Nenhuma entrada de estoque.',
      children: [
        for (final entry in stock)
          _RecordCard(
            title: bookName(entry.bookId),
            subtitle: '${entry.quantity} exemplares disponiveis',
            icon: Icons.inventory_2_outlined,
            onEdit: () => _openStockDialog(context, entry),
            onDelete: () => onDelete(entry),
          ),
      ],
    );
  }

  Future<void> _openStockDialog(
    BuildContext context, [
    StockEntry? entry,
  ]) async {
    var bookId = entry?.bookId ?? books.first.id;
    final quantity = TextEditingController(text: '${entry?.quantity ?? 0}');
    final result = await _showEntityDialog<StockEntry>(
      context: context,
      title: entry == null ? 'Nova entrada' : 'Editar estoque',
      fields: [
        StatefulBuilder(
          builder: (context, setLocalState) => DropdownButtonFormField<int>(
            initialValue: bookId,
            decoration: const InputDecoration(labelText: 'Livro'),
            items: [
              for (final book in books)
                DropdownMenuItem(value: book.id, child: Text(book.title)),
            ],
            onChanged: (value) => setLocalState(() => bookId = value ?? bookId),
          ),
        ),
        TextField(
          controller: quantity,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Quantidade'),
        ),
      ],
      buildResult: () => StockEntry(
        id: entry?.id ?? 0,
        bookId: bookId,
        quantity: int.tryParse(quantity.text) ?? 0,
      ),
    );
    if (result != null) onSave(result);
  }
}

class _ClassesPage extends StatelessWidget {
  const _ClassesPage({
    required this.classes,
    required this.onSave,
    required this.onDelete,
  });

  final List<SchoolClass> classes;
  final ValueChanged<SchoolClass> onSave;
  final ValueChanged<SchoolClass> onDelete;

  @override
  Widget build(BuildContext context) {
    return _ListPage(
      title: 'Turmas',
      actionLabel: 'Nova turma',
      onAdd: () => _openClassDialog(context),
      isEmpty: classes.isEmpty,
      emptyMessage: 'Nenhuma turma cadastrada.',
      children: [
        for (final schoolClass in classes)
          _RecordCard(
            title: schoolClass.name,
            subtitle: schoolClass.course,
            icon: Icons.groups_outlined,
            onEdit: () => _openClassDialog(context, schoolClass),
            onDelete: () => onDelete(schoolClass),
          ),
      ],
    );
  }

  Future<void> _openClassDialog(
    BuildContext context, [
    SchoolClass? schoolClass,
  ]) async {
    final name = TextEditingController(text: schoolClass?.name ?? '');
    final course = TextEditingController(text: schoolClass?.course ?? '');
    final result = await _showEntityDialog<SchoolClass>(
      context: context,
      title: schoolClass == null ? 'Nova turma' : 'Editar turma',
      fields: [
        TextField(
          controller: name,
          decoration: const InputDecoration(labelText: 'Nome da turma'),
        ),
        TextField(
          controller: course,
          decoration: const InputDecoration(labelText: 'Curso'),
        ),
      ],
      buildResult: () => SchoolClass(
        id: schoolClass?.id ?? 0,
        name: name.text,
        course: course.text,
      ),
    );
    if (result != null) onSave(result);
  }
}

class _PeoplePage extends StatelessWidget {
  const _PeoplePage({
    required this.employees,
    required this.roles,
    required this.roleName,
    required this.onSaveEmployee,
    required this.onDeleteEmployee,
    required this.onSaveRole,
    required this.onDeleteRole,
  });

  final List<Employee> employees;
  final List<Role> roles;
  final String Function(int id) roleName;
  final ValueChanged<Employee> onSaveEmployee;
  final ValueChanged<Employee> onDeleteEmployee;
  final ValueChanged<Role> onSaveRole;
  final ValueChanged<Role> onDeleteRole;

  @override
  Widget build(BuildContext context) {
    return _PageScaffold(
      title: 'Equipe',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FilledButton.icon(
                onPressed: roles.isEmpty
                    ? null
                    : () => _openEmployeeDialog(context),
                icon: const Icon(Icons.person_add_alt_1),
                label: const Text('Funcionario'),
              ),
              const SizedBox(width: 8),
              OutlinedButton.icon(
                onPressed: () => _openRoleDialog(context),
                icon: const Icon(Icons.add_moderator_outlined),
                label: const Text('Cargo'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _SectionTitle('Funcionarios'),
          const SizedBox(height: 8),
          if (employees.isEmpty)
            const _EmptyState(message: 'Cadastre cargos e funcionarios.')
          else
            _LaravelTable(
              children: [
                for (final employee in employees)
                  _RecordCard(
                    title: employee.name,
                    subtitle:
                        '${roleName(employee.roleId)} - NIF ${employee.nif} - CPF ${employee.cpf}',
                    icon: Icons.badge_outlined,
                    onEdit: () => _openEmployeeDialog(context, employee),
                    onDelete: () => onDeleteEmployee(employee),
                  ),
              ],
            ),
          const SizedBox(height: 16),
          const _SectionTitle('Cargos'),
          const SizedBox(height: 8),
          _LaravelTable(
            children: [
              for (final role in roles)
                _RecordCard(
                  title: role.name,
                  subtitle: 'Cargo cadastrado',
                  icon: Icons.admin_panel_settings_outlined,
                  onEdit: () => _openRoleDialog(context, role),
                  onDelete: () => onDeleteRole(role),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _openEmployeeDialog(
    BuildContext context, [
    Employee? employee,
  ]) async {
    var roleId = employee?.roleId ?? roles.first.id;
    final name = TextEditingController(text: employee?.name ?? '');
    final nif = TextEditingController(text: employee?.nif ?? '');
    final cpf = TextEditingController(text: employee?.cpf ?? '');
    final result = await _showEntityDialog<Employee>(
      context: context,
      title: employee == null ? 'Novo funcionario' : 'Editar funcionario',
      fields: [
        TextField(
          controller: name,
          decoration: const InputDecoration(labelText: 'Nome'),
        ),
        TextField(
          controller: nif,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'NIF'),
        ),
        TextField(
          controller: cpf,
          decoration: const InputDecoration(labelText: 'CPF'),
        ),
        StatefulBuilder(
          builder: (context, setLocalState) => DropdownButtonFormField<int>(
            initialValue: roleId,
            decoration: const InputDecoration(labelText: 'Cargo'),
            items: [
              for (final role in roles)
                DropdownMenuItem(value: role.id, child: Text(role.name)),
            ],
            onChanged: (value) => setLocalState(() => roleId = value ?? roleId),
          ),
        ),
      ],
      buildResult: () => Employee(
        id: employee?.id ?? 0,
        nif: nif.text,
        name: name.text,
        cpf: cpf.text,
        roleId: roleId,
      ),
    );
    if (result != null) onSaveEmployee(result);
  }

  Future<void> _openRoleDialog(BuildContext context, [Role? role]) async {
    final name = TextEditingController(text: role?.name ?? '');
    final result = await _showEntityDialog<Role>(
      context: context,
      title: role == null ? 'Novo cargo' : 'Editar cargo',
      fields: [
        TextField(
          controller: name,
          decoration: const InputDecoration(labelText: 'Nome do cargo'),
        ),
      ],
      buildResult: () => Role(id: role?.id ?? 0, name: name.text),
    );
    if (result != null) onSaveRole(result);
  }
}

class _RequisitionsPage extends StatelessWidget {
  const _RequisitionsPage({
    required this.requisitions,
    required this.books,
    required this.classes,
    required this.employees,
    required this.bookName,
    required this.className,
    required this.employeeName,
    required this.onSave,
    required this.onDelete,
  });

  final List<Requisition> requisitions;
  final List<Book> books;
  final List<SchoolClass> classes;
  final List<Employee> employees;
  final String Function(int id) bookName;
  final String Function(int id) className;
  final String Function(int id) employeeName;
  final ValueChanged<Requisition> onSave;
  final ValueChanged<Requisition> onDelete;

  @override
  Widget build(BuildContext context) {
    final canAdd =
        books.isNotEmpty && classes.isNotEmpty && employees.isNotEmpty;
    return _ListPage(
      title: 'Requisicoes',
      actionLabel: 'Nova requisicao',
      onAdd: canAdd ? () => _openRequisitionDialog(context) : null,
      isEmpty: requisitions.isEmpty,
      emptyMessage: canAdd
          ? 'Nenhuma requisicao cadastrada.'
          : 'Cadastre livros, turmas e funcionarios primeiro.',
      children: [
        for (final requisition in requisitions)
          _RecordCard(
            title: bookName(requisition.bookId),
            subtitle:
                '${className(requisition.classId)} - ${employeeName(requisition.employeeId)} - ${_formatDate(requisition.date)}',
            trailing: '${requisition.quantity} un.',
            icon: Icons.assignment_outlined,
            onEdit: () => _openRequisitionDialog(context, requisition),
            onDelete: () => onDelete(requisition),
          ),
      ],
    );
  }

  Future<void> _openRequisitionDialog(
    BuildContext context, [
    Requisition? requisition,
  ]) async {
    var bookId = requisition?.bookId ?? books.first.id;
    var classId = requisition?.classId ?? classes.first.id;
    var employeeId = requisition?.employeeId ?? employees.first.id;
    var date = requisition?.date ?? DateTime.now();
    final quantity = TextEditingController(
      text: '${requisition?.quantity ?? 1}',
    );
    final result = await _showEntityDialog<Requisition>(
      context: context,
      title: requisition == null ? 'Nova requisicao' : 'Editar requisicao',
      fields: [
        StatefulBuilder(
          builder: (context, setLocalState) => DropdownButtonFormField<int>(
            initialValue: bookId,
            decoration: const InputDecoration(labelText: 'Livro'),
            items: [
              for (final book in books)
                DropdownMenuItem(value: book.id, child: Text(book.title)),
            ],
            onChanged: (value) => setLocalState(() => bookId = value ?? bookId),
          ),
        ),
        StatefulBuilder(
          builder: (context, setLocalState) => DropdownButtonFormField<int>(
            initialValue: classId,
            decoration: const InputDecoration(labelText: 'Turma'),
            items: [
              for (final schoolClass in classes)
                DropdownMenuItem(
                  value: schoolClass.id,
                  child: Text(schoolClass.name),
                ),
            ],
            onChanged: (value) =>
                setLocalState(() => classId = value ?? classId),
          ),
        ),
        StatefulBuilder(
          builder: (context, setLocalState) => DropdownButtonFormField<int>(
            initialValue: employeeId,
            decoration: const InputDecoration(labelText: 'Funcionario'),
            items: [
              for (final employee in employees)
                DropdownMenuItem(
                  value: employee.id,
                  child: Text(employee.name),
                ),
            ],
            onChanged: (value) =>
                setLocalState(() => employeeId = value ?? employeeId),
          ),
        ),
        TextField(
          controller: quantity,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Quantidade'),
        ),
        StatefulBuilder(
          builder: (context, setLocalState) => OutlinedButton.icon(
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2020),
                lastDate: DateTime(2035),
              );
              if (picked != null) setLocalState(() => date = picked);
            },
            icon: const Icon(Icons.calendar_today_outlined),
            label: Text(_formatDate(date)),
          ),
        ),
      ],
      buildResult: () => Requisition(
        id: requisition?.id ?? 0,
        date: date,
        bookId: bookId,
        classId: classId,
        employeeId: employeeId,
        quantity: int.tryParse(quantity.text) ?? 1,
      ),
    );
    if (result != null) onSave(result);
  }
}

class _PageScaffold extends StatelessWidget {
  const _PageScaffold({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x14000000),
                offset: Offset(0, 1),
                blurRadius: 3,
              ),
            ],
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xff1f2937),
                      fontSize: 20,
                      height: 1.4,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
            children: [
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1280),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContentPanel extends StatelessWidget {
  const _ContentPanel({
    required this.child,
    this.padding = const EdgeInsets.all(24),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0f000000),
            offset: Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}

class _LaravelTable extends StatelessWidget {
  const _LaravelTable({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return _ContentPanel(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          for (var index = 0; index < children.length; index++) ...[
            children[index],
            if (index != children.length - 1) const Divider(height: 1),
          ],
        ],
      ),
    );
  }
}

class _ActionHeader extends StatelessWidget {
  const _ActionHeader({required this.actionLabel, required this.onAdd});

  final String actionLabel;
  final VoidCallback? onAdd;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: FilledButton.icon(
        onPressed: onAdd,
        icon: const Icon(Icons.add, size: 18),
        label: Text(actionLabel),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xff1f2937),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _DashboardGrid extends StatelessWidget {
  const _DashboardGrid({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final columns = width >= 900
            ? 4
            : width >= 640
            ? 2
            : 1;
        final spacing = 12.0;
        final itemWidth = (width - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final child in children)
              SizedBox(width: itemWidth, child: child),
          ],
        );
      },
    );
  }
}

class _ListPage extends StatelessWidget {
  const _ListPage({
    required this.title,
    required this.actionLabel,
    required this.onAdd,
    required this.isEmpty,
    required this.emptyMessage,
    required this.children,
  });

  final String title;
  final String actionLabel;
  final VoidCallback? onAdd;
  final bool isEmpty;
  final String emptyMessage;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return _PageScaffold(
      title: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ActionHeader(actionLabel: actionLabel, onAdd: onAdd),
          const SizedBox(height: 16),
          if (isEmpty)
            _EmptyState(message: emptyMessage)
          else
            _LaravelTable(children: children),
        ],
      ),
    );
  }
}

class _RecordCard extends StatelessWidget {
  const _RecordCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onEdit,
    required this.onDelete,
    this.trailing,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xff6b7280), size: 22),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xff111827),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xff6b7280),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Wrap(
            spacing: 4,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if (trailing != null)
                Text(
                  trailing!,
                  style: const TextStyle(
                    color: Color(0xff374151),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              IconButton(
                tooltip: 'Editar',
                onPressed: onEdit,
                icon: const Icon(Icons.edit_outlined, size: 20),
                color: const Color(0xff6b7280),
              ),
              IconButton(
                tooltip: 'Excluir',
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline, size: 20),
                color: const Color(0xff6b7280),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ReadOnlyRow extends StatelessWidget {
  const _ReadOnlyRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xff6b7280), size: 22),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xff111827),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xff6b7280),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            trailing,
            style: const TextStyle(
              color: Color(0xff374151),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return _ContentPanel(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xff4b5563), size: 22),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xff111827),
              fontSize: 28,
              height: 1.15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(color: Color(0xff6b7280), fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return _ContentPanel(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Center(child: Text(message, textAlign: TextAlign.center)),
      ),
    );
  }
}

Future<T?> _showEntityDialog<T>({
  required BuildContext context,
  required String title,
  required List<Widget> fields,
  required T Function() buildResult,
}) {
  return showDialog<T>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: 420,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final field in fields)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: field,
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, buildResult()),
          child: const Text('Salvar'),
        ),
      ],
    ),
  );
}

String _formatDate(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
}
