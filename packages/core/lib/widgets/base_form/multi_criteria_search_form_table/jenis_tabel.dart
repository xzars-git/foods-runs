import 'package:core/core.dart';

enum JenisTabelEnum {
  objekPajak(
    label: 'Objek Pajak',
    value: 'objek_pajak',
  ),
  subjekPajak(
    label: 'Subjek Pajak',
    value: 'subjek_pajak',
  ),
  transaksi(
    label: 'Transaksi',
    value: 'transaksi',
  ),
  report(
    label: 'Report',
    value: 'report',
  ),
  reportLampau(
    label: 'Report Lampau',
    value: 'report_lampau',
  );

  final String label;
  final String value;

  const JenisTabelEnum({
    required this.label,
    required this.value,
  });
}

class JenisTabel {
  final DataUser roleData;
  late List<BaseDropdownOption> options;

  JenisTabel({
    required this.roleData,
  }) {
    options = [
      if (References.check.isRoleActive(roleData.roleMenuTabelObjekPajak))
        BaseDropdownOption(
          label: JenisTabelEnum.objekPajak.label,
          value: JenisTabelEnum.objekPajak.value,
        ),
      if (References.check.isRoleActive(roleData.roleMenuTabelSubjekPajak))
        BaseDropdownOption(
          label: JenisTabelEnum.subjekPajak.label,
          value: JenisTabelEnum.subjekPajak.value,
        ),
      if (References.check.isRoleActive(roleData.roleMenuTabelTransaksi))
        BaseDropdownOption(
          label: JenisTabelEnum.transaksi.label,
          value: JenisTabelEnum.transaksi.value,
        ),
      if (References.check.isRoleActive(roleData.roleMenuTabelPembayaran))
        BaseDropdownOption(
          label: JenisTabelEnum.report.label,
          value: JenisTabelEnum.report.value,
        ),
      if (References.check.isRoleActive(roleData.roleMenuTabelPembayaranLampau))
        BaseDropdownOption(
          label: JenisTabelEnum.reportLampau.label,
          value: JenisTabelEnum.reportLampau.value,
        ),
    ];
  }

  static final BaseDropdownOption defaultOption = BaseDropdownOption(
    label: JenisTabelEnum.objekPajak.label,
    value: JenisTabelEnum.objekPajak.value,
  );
}
