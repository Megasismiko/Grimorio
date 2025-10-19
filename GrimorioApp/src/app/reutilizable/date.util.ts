// src/app/utils/date.util.ts
export class DateUtil {
	static formatDateString(v?: string): string {
		if (!v) return '';
		const raw = v.substring(0, 10);
		// Si viene como yyyy-MM-dd -> convertir a dd/MM/yyyy
		const iso = /^(\d{4})-(\d{2})-(\d{2})$/;
		const dmY = /^(\d{2})\/(\d{2})\/(\d{4})$/;

		if (iso.test(raw)) {
			const [, y, m, d] = raw.match(iso)!;
			return `${d}/${m}/${y}`;
		}
		if (dmY.test(raw)) return raw;

		// Cualquier otra cosa, intentar sanitizar
		return raw.replaceAll('-', '/');
	}
}
