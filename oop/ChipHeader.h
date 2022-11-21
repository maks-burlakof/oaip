/*
������� ��������� � ������� Chip, ����������� ������� � ������ � ����������� ������, ���������� �� ������.
����� �������� � ���� ��������� ���� � ������:
- ��� (�����������, ����������);
- �������������� �������;
- ������������;
- ��������� (����������������/������������ ������);
- ���/����� ���� ������������;
- �����/�����-�������������;

- ����������� �� ���������;
- ����������;
- ����� ������������� �������� ��������� ��������;
- �������-����, ��������� ������ ���������, ��������� �������������� �������;
- ����������� ����� ��������� �������� ������� print().

����������� ����� Type ����� ��������� ��������:
- ��� (��� ����������� ������ � �����������/������������; ��� ���������� � � ������������� ���������/� ����������������);
- ������ (�����/��������������);
- ����������� ����� ��������� ��������� ��������.
*/


#pragma once
#include <iostream>

using namespace std;

class Chip {
public:
	char name[81];
	char type[81];
	int capacity;
	char interface_type[81];
	char manufacture_date[81];
	char factory_name[81];

	friend void chipList(int, Chip&);

	Chip() {
		strcpy_s(name, "");
		strcpy_s(type, "");
		capacity = 0;
		strcpy_s(interface_type, "");
		strcpy_s(manufacture_date, "");
		strcpy_s(factory_name, "");
	}

	Chip(char *n, char* t, int c, char* i, char* m, char* f) {
		strcpy_s(name, n);
		strcpy_s(type, t);
		capacity = c;
		strcpy_s(interface_type, i);
		strcpy_s(manufacture_date, m);
		strcpy_s(factory_name, f);
	}

	// ����� ������������� �������� ��������� ��������??

	virtual void print() {
		cout << "������������: " << name << "\n"
			"��� ������: " << type << "\n"
			"�������������� �������: " << capacity << "\n"
			"��������� ������: " << interface_type << "\n"
			"���/����� ���� ������������: " << manufacture_date << "\n"
			"�����/�����-�������������: " << factory_name << "\n";
	}

	~Chip() {
		cout << "���������� ������ ��� ������� '" << name << "'\n";
	}
};


void chipList(int cap, Chip& self) {
	int n = 0;
	if (self.capacity == cap) {
		cout << ++n << ".\n";
		self.print();
	}
}


class Type : public Chip {
public:
	char sort[81];
	char status[81];

	Type() :Chip() {
		strcpy_s(sort, "");
		strcpy_s(status, "");
	}

	Type(char* n, char* t, char* sor, int c, char* i, char* m, char* f, char* stat) :Chip(n, t, c, i, m, f) {
		strcpy_s(sort, sor);
		strcpy_s(status, stat);
	}

	void print() {
		cout << "������������: " << name << "\n"
			"��� ������: " << type << "\n"
			"���: " << sort << "\n"
			"�������������� �������: " << capacity << "\n"
			"��������� ������: " << interface_type << "\n"
			"���/����� ���� ������������: " << manufacture_date << "\n"
			"�����/�����-�������������: " << factory_name << "\n"
			"������: " << status << "\n";
	}

	~Type() {
		cout << "���������� ������ ��� ������� '" << name << "'\n";
	}
};