#pragma once
using namespace std;


double input(bool);


template <class Templ>
class List {
private:
	int n;
	Templ* arr;
	Templ* task_arr;
public:
	List() {
		// int MAX = 5;
		// arr = new Templ[MAX];
		n = 0;
	}

	List(int num) {
		arr = new Templ[num];
		n = num;
	}
	
	~List() {
		delete[] arr;
		delete[] task_arr;
	}

	Templ& operator[](int i) {
		return arr[i];
	}

	void set() {
		for (int i = 0; i < n; i++) {
			cout << "#" << i + 1 << ":\n >> ";
			cin >> arr[i];
		}
	}

	void set(int num) {
		if (num > n) {
			cout << "��������� �������� ��������� ����� ����� ��������� �������!\n";
			return;
		}
		cout << "#" << num << ":\n >> ";
		cin >> arr[num - 1];
	}

	bool remove(int num) {
		if (num > n) {
			cout << "��������� �������� ��������� ����� ����� ��������� �������!\n";
			return false;
		}
		for (int i = num - 1; i < n-1; i++) {
			arr[i] = arr[i + 1];
		}
		n--;
		cout << "������� � ������� " << num << " �����.";
		return true;
	}

	void print() {
		for (int i = 0; i < n; i++) {
			cout << "|" << i + 1 << "|" << arr[i] << "\n";
		}
	}
	
	void task() {
		task_arr = new Templ[n];

		cout << "     ��������\t\t������, ���������\n ������ ��������\t  �� ���������\n\n";

		for (int i = 0; i < n; i++) {
			int sum = 0;
			for (int j = 0; j <= i; j++)
				sum += arr[j];
			task_arr[i] = abs(sum);
			cout << " |" << i + 1 << "|" << arr[i] << "\t\t";
			cout << " |" << i + 1 << "|" << task_arr[i] << "\n";
		}
	}
};


double input(bool positive=false) {
	double in;
	while (!(cin >> in) || (positive && in < 0)) {
		cout << "��������� �������� ������ ���� ������! ��������� �������.\n >> ";
		cin.clear();
		while (cin.get() != '\n');
	}
	return in;
}