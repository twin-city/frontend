export async function handle({ event, resolve }) {
    console.log(event)
    return resolve(event, { ssr: false });
}
