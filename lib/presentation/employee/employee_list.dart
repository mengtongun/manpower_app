import 'package:another_flushbar/flushbar_helper.dart';
import 'package:app/core/widgets/progress_indicator_widget.dart';
import 'package:app/core/widgets/textfield_widget.dart';
import 'package:app/di/service_locator.dart';
import 'package:app/domain/entity/employee/employee.dart';
import 'package:app/domain/usecase/employee/update_employee_usecase.dart';
import 'package:app/presentation/employee/store/employee_store.dart';
import 'package:app/presentation/home/store/theme/theme_store.dart';
import 'package:app/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:validators/validators.dart';

class EmployeeListScreen extends StatefulWidget {
  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  //stores:---------------------------------------------------------------------
  final EmployeeStore _employeeStore = getIt<EmployeeStore>();
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final _formKey = GlobalKey<FormState>();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // check to see if already called api
    if (!_employeeStore.loading) {
      _employeeStore.getEmployees();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _handleErrorMessage(),
        _buildMainContent(),
      ],
    );
  }

  Widget _buildMainContent() {
    return Observer(
      builder: (context) {
        return _employeeStore.loading
            ? CustomProgressIndicatorWidget()
            : Material(child: _buildListView());
      },
    );
  }

  Widget _buildListView() {
    return _employeeStore.employeeList != null
        ? ListView.builder(
            itemCount: _employeeStore.employeeList!.employees!.length,
            itemBuilder: (context, position) {
              return _buildCardItem(position);
            },
          )
        : Center(
            child: Text(
              AppLocalizations.of(context)
                  .translate('home_tv_no_employee_found'),
            ),
          );
  }

  Widget _buildCardItem(int idx) {
    Employee? _employee = _employeeStore.employeeList?.employees?[idx];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            left: 30.0,
            right: 5.0,
            top: 15.0,
            bottom: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 5,
                        ),
                        // * Employee Info
                        Text("${_employee?.name}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    color: _themeStore.darkMode
                                        ? Theme.of(context).colorScheme.primary
                                        : Colors.blueGrey)),
                        Text("${_employee?.designation}",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Colors.blueGrey)),
                        SizedBox(
                          height: 15,
                        ),
                        // * End Employee Info

                        // * Begin Supervisor Info
                        Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            AppLocalizations.of(context)
                                .translate('employee_lt_supervisor'),
                            style: Theme.of(context).textTheme.titleSmall),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          "${_employee?.supervisor}",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        // * End Supervisor Info

                        // * Begin Team Info
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            AppLocalizations.of(context)
                                .translate('employee_lt_team'),
                            style: Theme.of(context).textTheme.titleSmall),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          "${_employee?.team}",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        // * End Team Info

                        // * Begin Project Info
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            AppLocalizations.of(context)
                                .translate('employee_lt_project'),
                            style: Theme.of(context).textTheme.titleSmall),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          "${_employee?.project}",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        // * End Project Info
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // * Begin Identity Info
                        Text("ID: ${_employee?.manpowerId}",
                            style: Theme.of(context).textTheme.titleSmall),
                        Text("NRIC Digit: ${_employee?.nric4Digit}",
                            style: Theme.of(context).textTheme.labelMedium),
                        // * End Identity Info

                        // * Begin Joined Date Info
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          AppLocalizations.of(context)
                              .translate('employee_lt_join_date'),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("2019-06-07",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.labelSmall),
                        // * End Joined Date Info

                        // * Begin Resign Date Info
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          AppLocalizations.of(context)
                              .translate('employee_lt_resign_date'),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "2019-06-07",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 12,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        // * End Resign Date Info
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          OutlinedButton.icon(
                            onPressed: () async {
                              await showUpdateEmployeeForm(_employee);
                            },
                            label: Text(AppLocalizations.of(context)
                                .translate("employee_btn_edit")),
                            icon: Icon(
                              Icons.edit_document,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showUpdateEmployeeForm(Employee? employee) async {
    String? _manpowerId;
    String? _designation;
    String? _project;
    String? _team;
    String? _supervisor;
    String? _joinDate;
    String? _resignDate;

    if (employee != null) {
      _manpowerId = employee.manpowerId;
      _designation = employee.designation;
      _project = employee.project;
      _team = employee.team;
      _supervisor = employee.supervisor;
      _joinDate = employee.joinDate;
      _resignDate = employee.resignDate;
    }

    await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              actions: [
                ElevatedButton(
                  child: Text(
                      AppLocalizations.of(context)
                          .translate("employee_btn_cancel"),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.red[300])),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Observer(
                  builder: (context) => ElevatedButton.icon(
                    icon: _employeeStore.loadingUpdate
                        ? Container(
                            width: 24,
                            height: 24,
                            padding: const EdgeInsets.all(2.0),
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                              strokeWidth: 3,
                            ),
                          )
                        : null,
                    label: Text(
                      AppLocalizations.of(context)
                          .translate('employee_btn_update'),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.blue[300]),
                    ),
                    onPressed: _employeeStore.loadingUpdate
                        ? null
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              // Update the Employee object with new values
                              final data = UpdateEmployeeParams(
                                manpowerId: _manpowerId,
                                designation: _designation,
                                project: _project,
                                team: _team,
                                supervisor: _supervisor,
                                joinDate: _joinDate,
                                resignDate: _resignDate,
                              );
                              await _employeeStore.updateEmployees(data);
                              Navigator.of(context).pop();
                            }
                          },
                  ),
                ),
              ],
              title: Text("Update's ${employee?.name} Info",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Theme.of(context).colorScheme.primary)),
              insetPadding: EdgeInsets.zero,
              content: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // * Designation
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFieldWidget(
                            initialValue: _designation,
                            icon: Icons.contacts_rounded,
                            label: AppLocalizations.of(context)
                                .translate('employee_lt_designation'),
                            hint: AppLocalizations.of(context)
                                .translate('employee_ht_designation'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter job title';
                              }
                              return null;
                            },
                            onSaved: (newValue) => _designation = newValue,
                          ),
                        ),

                        // * Supervisor
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFieldWidget(
                            icon: Icons.manage_accounts,
                            initialValue: _supervisor,
                            label: AppLocalizations.of(context)
                                .translate('employee_lt_supervisor'),
                            hint: AppLocalizations.of(context)
                                .translate('employee_ht_supervisor'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Supervisor';
                              }
                              return null;
                            },
                            onSaved: (newValue) => _supervisor = newValue,
                          ),
                        ),

                        // * Team
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFieldWidget(
                            initialValue: _team,
                            icon: Icons.groups,
                            label: AppLocalizations.of(context)
                                .translate('employee_lt_team'),
                            hint: AppLocalizations.of(context)
                                .translate('employee_ht_team'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Team';
                              }
                              return null;
                            },
                            onSaved: (newValue) => _team = newValue,
                          ),
                        ),
                        // * Project
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFieldWidget(
                            initialValue: _project,
                            icon: Icons.display_settings_rounded,
                            label: AppLocalizations.of(context)
                                .translate('employee_lt_project'),
                            hint: AppLocalizations.of(context)
                                .translate('employee_ht_project'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Project';
                              }
                              return null;
                            },
                            onSaved: (newValue) => _project = newValue,
                          ),
                        ),
                        // * Join Date
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFieldWidget(
                            initialValue: _joinDate,
                            icon: Icons.date_range,
                            inputType: TextInputType.datetime,
                            label: AppLocalizations.of(context)
                                .translate('employee_lt_join_date'),
                            hint: AppLocalizations.of(context)
                                .translate('employee_ht_join_date'),
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Please enter join date';
                              if (value.length != 10 || !isDate(value))
                                return 'Please enter date in YYYY-MM-DD format';
                              return null;
                            },
                            onSaved: (newValue) => _joinDate = newValue,
                          ),
                        ),
                        // * Resign Date
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFieldWidget(
                            initialValue: _resignDate,
                            icon: Icons.leave_bags_at_home,
                            inputType: TextInputType.datetime,
                            label: AppLocalizations.of(context)
                                .translate('employee_lt_resign_date'),
                            hint: AppLocalizations.of(context)
                                .translate('employee_ht_resign_date'),
                            validator: (value) {
                              if (value == null || value.isEmpty) return null;
                              if (value.length != 10 || !isDate(value))
                                return 'Please enter date in YYYY-MM-DD format';
                              return null;
                            },
                            onSaved: (newValue) => _resignDate =
                                newValue == null || newValue.isEmpty
                                    ? null
                                    : newValue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }

  Widget _handleErrorMessage() {
    return Observer(
      builder: (context) {
        if (_employeeStore.errorStore.errorMessage.isNotEmpty) {
          return _showErrorMessage(_employeeStore.errorStore.errorMessage);
        }

        return SizedBox.shrink();
      },
    );
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: AppLocalizations.of(context).translate('home_tv_error'),
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return SizedBox.shrink();
  }
}
