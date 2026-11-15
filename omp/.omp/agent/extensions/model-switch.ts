// /codex e /glm — troca rápida do modelo ativo.
// /codex → openai-codex/gpt-6.1-sol (plan), /glm → zai/glm-5.3-flash:low (código).
// Troca pelo pi.setModel, mesmo caminho do /model nativo.

export default function (pi: ExtensionAPI) {
	const targets: [string, string][] = [
		["codex", "openai-codex/gpt-6.1-sol"],
		["glm", "zai/glm-5.3-flash:low"],
	]

	for (const [name, spec] of targets) {
		pi.registerCommand(name, {
			description: `Switch model to ${spec}`,
			handler: async (_args, ctx) => {
				const model = ctx.models.resolve(spec)
				if (!model) {
					ctx.ui.notify(`Model not found: ${spec}`, "error")
					return
				}
				await pi.setModel(model)
				ctx.ui.notify(`Model: ${model.id}`, "info")
			},
		})
	}
}
